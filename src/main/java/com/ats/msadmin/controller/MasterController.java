package com.ats.msadmin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.common.VpsImageUpload;
import com.ats.msadmin.model.master.Category;
import com.ats.msadmin.model.master.ErrorMessage;
import com.ats.msadmin.model.master.GetRoute;
import com.ats.msadmin.model.master.Hub;
import com.ats.msadmin.model.master.Route;
import com.ats.msadmin.model.user.MahasanghUser;

@Controller
public class MasterController {
	RestTemplate rest = new RestTemplate();
	//
	
	List<Category> catList;
	List<Hub> hubList;
	List<MahasanghUser> mhsUsrList;
	List<RouteSup> routeSupList;
	
	List<GetRoute> routeList;
	
	

	@RequestMapping(value = "/showAddCat", method = RequestMethod.GET)
	public ModelAndView showAddCatMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}


			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			Category[] catRes = rest.getForObject(Constants.url + "getAllCatByIsUsed", Category[].class);
			catList = new ArrayList<Category>(Arrays.asList(catRes));

			model = new ModelAndView("masters/addcat");
			model.addObject("langSelected", langSelected);

			
			model.addObject("catImageUrl", Constants.CAT_FOLDER);

			model.addObject("catList", catList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertCategory  same call for edit 

	@RequestMapping(value = "/insertCategory", method = RequestMethod.POST)
	public String insertCategoryMethod(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imgInp") List<MultipartFile> file) {
		
		try {

			int catId = Integer.parseInt(request.getParameter("cat_id"));
			
			System.err.println("cat Id  " +catId);
			String catMrName = request.getParameter("catTxtMarathi");
			String catEnName = request.getParameter("catTxtEnglish");

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			
			String catImage=request.getParameter("prevImage");
		//	System.err.println("Prev Image =" +catImage);
			try {
			if(!file.get(0).getOriginalFilename().equalsIgnoreCase("")) {
				VpsImageUpload imgUpload = new VpsImageUpload();
				
				String tStamp = dateFormat.format(cal.getTime());
				String extension = FilenameUtils.getExtension(file.get(0).getOriginalFilename());

				catImage=new String();
				catImage=tStamp + "." + extension;
				imgUpload.saveUploadedFiles(file, Constants.CAT_FILE_TYPE, catImage);
			
			}
			}catch (Exception e) {
				System.err.println("Exc in uploading cat Imag " +e.getMessage());
				e.printStackTrace();
			
			}
			// System.err.println("tStamp " + tStamp + "." + extension);
			// System.err.println("cat Marathi name " + catMrName);
			// System.err.println("cat English name " + catEnName);

			Category cat = new Category();
			
			cat.setCatId(catId);
			cat.setCatEngName(catEnName);
			cat.setCatMarName(catMrName);
			cat.setCatPic(catImage);
			cat.setIsUsed(1);

			Category catInsertResponse = rest.postForObject(Constants.url + "saveCat", cat, Category.class);

		} catch (Exception e) {

			System.err.println("Exception in /insertCategory @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddCat";

	}

	//

	@RequestMapping(value = "/getEditCategory", method = RequestMethod.GET)
	public @ResponseBody Category getEditCategoryMethod(HttpServletRequest request, HttpServletResponse response) {
		Category catEdit = null;

		try {
			int catId = Integer.parseInt(request.getParameter("catId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("catId", catId);
			catEdit = rest.postForObject(Constants.url + "getCatByCatId", map, Category.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return catEdit;

	}
	
	//deleteCategory
	
	@RequestMapping(value = "/deleteCategory/{catId}", method =RequestMethod.GET)
	public String deleteCategoryMethod(HttpServletRequest request, HttpServletResponse response,@PathVariable int catId) {
		
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("catId", catId);
			
			ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteCategory", map, ErrorMessage.class);

		} catch (Exception e) {

			System.err.println("Exception in /deleteCategory @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddCat";

	}
	
	
	@RequestMapping(value = "/showAddItem", method = RequestMethod.GET)
	public ModelAndView showAddItemMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("masters/additem");

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}
	
	@RequestMapping(value = "/showAddMSUser", method = RequestMethod.GET)
	public ModelAndView showAddMSUserMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("masters/addMsUser");
			
			
			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);

			//getAllHubByIsUsed
			Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
			hubList = new ArrayList<Hub>(Arrays.asList(hubRes));
			
			model.addObject("hubList", hubList);
			
			//getAllMSByIsUsed
			MahasanghUser[] mhsUsr = rest.getForObject(Constants.url + "getAllMSByIsUsed", MahasanghUser[].class);
			mhsUsrList = new ArrayList<MahasanghUser>(Arrays.asList(mhsUsr));
			
			model.addObject("mhsUsrList", mhsUsrList);
			
		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}
	
	//insertMsUser
	@RequestMapping(value = "/insertMsUser", method = RequestMethod.POST)
	public String insertMsUserMethod(HttpServletRequest request, HttpServletResponse response) {
		
		try {

			int msId = Integer.parseInt(request.getParameter("ms_id"));
			
			String mrName = request.getParameter("usrname_mr");
			String engName = request.getParameter("usrname_eng");
			String uPass = request.getParameter("usr_pass");
			String conNo = request.getParameter("contact_no");
			
			int role=Integer.parseInt(request.getParameter("usr_role"));
	
			String[] selHub=request.getParameterValues("sel_hub");
			StringBuilder sb = new StringBuilder();
			
			for (int i = 0; i < selHub.length; i++) {
				sb = sb.append(selHub[i] + ",");

			}
			String hubs = sb.toString();
			hubs = hubs.substring(0, hubs.length() - 1);
			System.out.println("hubs" + hubs);

			
			MahasanghUser msUser=new MahasanghUser();
			msUser.setMsId(msId);
			msUser.setHubIds(hubs);
			msUser.setIsAdmin(role);
			msUser.setIsBlock(1);
			msUser.setIsUsed(1);
			msUser.setMsContactNo(conNo);
			msUser.setMsEngName(engName);
			msUser.setMsMarName(mrName);
			msUser.setMsPwd(uPass);
			
			System.err.println("Marathi name  " +mrName);
			
		MahasanghUser msUserInsertResponse = rest.postForObject(Constants.url + "saveMahasnaghUser", msUser, MahasanghUser.class);

		}catch (Exception e) {
			System.err.println("Exception in /insertMsUser ->saveMahasnaghUser @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddMSUser";
}
	
	//getEditMsUser- aJax
	
	@RequestMapping(value = "/getEditMsUser", method = RequestMethod.GET)
	public @ResponseBody MahasanghUser getEditMsUserMethod(HttpServletRequest request, HttpServletResponse response) {
		MahasanghUser msUserEdit = null;

		try {
			
			int msId = Integer.parseInt(request.getParameter("msId"));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("msId", msId);
			
			msUserEdit = rest.postForObject(Constants.url + "getMsByMsId", map, MahasanghUser.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return msUserEdit;

	}
	
	//deleteMsUser
	
		@RequestMapping(value = "/deleteMsUser/{msId}", method =RequestMethod.GET)
		public String deleteMsUserMethod(HttpServletRequest request, HttpServletResponse response,@PathVariable int msId) {
			
			try {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("msId", msId);
				
				ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteMahasanghUser", map, ErrorMessage.class);

			} catch (Exception e) {

				System.err.println("Exception in /deleteMsUser @MastContr  " + e.getMessage());
				e.printStackTrace();
			}

			return "redirect:/showAddMSUser";

		}
		
		//showAddHub
		@RequestMapping(value = "/showAddHub", method = RequestMethod.GET)
		public ModelAndView showAddHubMethod(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = null;
			try {
				
				
				HttpSession session =request.getSession();
				
				MahasanghUser user=(MahasanghUser)session.getAttribute("user");
				System.err.println("USer From Session :  " +user.toString());

				Locale locale = LocaleContextHolder.getLocale();

				// System.err.println("current language is - " + locale.toString());

				int langSelected = 0;

				if (locale.toString().equalsIgnoreCase("mr")) {
					langSelected = 1;
				}
			
				model = new ModelAndView("masters/addhub");
				
				model.addObject("langSelected", langSelected);

				Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
				hubList = new ArrayList<Hub>(Arrays.asList(hubRes));

				model.addObject("hubList", hubList);

			} catch (Exception e) {

				e.printStackTrace();
			}

			return model;

		}
		
		//insertHub
		@RequestMapping(value = "/insertHub", method = RequestMethod.POST)
		public String insertHubMethod(HttpServletRequest request, HttpServletResponse response) {
			
			try {

				int hubId = Integer.parseInt(request.getParameter("hub_id"));
				
				String mrName = request.getParameter("hname_mr");
				String engName = request.getParameter("hname_eng");
				String hAdddMr = request.getParameter("hadd_mr");
				String hAdddEng = request.getParameter("hadd_eng");
				String conNo = request.getParameter("contact_no");
				
				Hub hub=new Hub();
				
				hub.setHubContactNo(conNo);
				hub.setHubEngAdd(hAdddEng);
				hub.setHubEngName(engName);
				hub.setHubId(hubId);
				hub.setHubMarAdd(hAdddMr);
				hub.setHubMarName(mrName);
				hub.setIsUsed(1);
				
				System.err.println("Marathi name  " +mrName);
				
			Hub hubInsertResponse = rest.postForObject(Constants.url + "saveHub", hub, Hub.class);

			}catch (Exception e) {
				System.err.println("Exception in /insertHub ->saveHub @MastContr  " + e.getMessage());
				e.printStackTrace();
			}
			return "redirect:/showAddHub";
	}
		
		//getEditHub- ajax
		
		@RequestMapping(value = "/getEditHub", method = RequestMethod.GET)
		public @ResponseBody Hub getEditHubMethod(HttpServletRequest request, HttpServletResponse response) {
			Hub hubEdit = null;

			try {
				
				int hubId = Integer.parseInt(request.getParameter("hubId"));
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("hubId", hubId);
				
				hubEdit = rest.postForObject(Constants.url + "getHubByHubId", map, Hub.class);

			} catch (Exception e) {

				e.printStackTrace();
			}

			return hubEdit;

		}
		
		//deleteHub
		
			@RequestMapping(value = "/deleteHub/{hubId}", method =RequestMethod.GET)
			public String deleteHubMethod(HttpServletRequest request, HttpServletResponse response,@PathVariable int hubId) {
				
				try {

					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					map.add("hubId", hubId);
					
					ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteHub", map, ErrorMessage.class);

				} catch (Exception e) {

					System.err.println("Exception in /deleteHub @MastContr  " + e.getMessage());
					e.printStackTrace();
				}

				return "redirect:/showAddHub";

			}
			
			
			//showAddRouteSupervisor
			
			@RequestMapping(value = "/showAddRouteSupervisor", method = RequestMethod.GET)
			public ModelAndView showAddRouteSupervisorMethod(HttpServletRequest request, HttpServletResponse response) {

				ModelAndView model = null;
				try {

					Locale locale = LocaleContextHolder.getLocale();

					// System.err.println("current language is - " + locale.toString());

					int langSelected = 0;

					if (locale.toString().equalsIgnoreCase("mr")) {
						langSelected = 1;
					}


					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					RouteSup[] rSupRes = rest.getForObject(Constants.url + "getAllRsByIsUsed", RouteSup[].class);
					routeSupList = new ArrayList<RouteSup>(Arrays.asList(rSupRes));

					model = new ModelAndView("masters/addroutesup");
					model.addObject("langSelected", langSelected);

					model.addObject("routeSupList", routeSupList);

				} catch (Exception e) {

					e.printStackTrace();
				}

				return model;

			}
		
			//insertRouteSup
			
			@RequestMapping(value = "/insertRouteSup", method = RequestMethod.POST)
			public String insertRouteSupMethod(HttpServletRequest request, HttpServletResponse response) {
				
				try {

					int supId = Integer.parseInt(request.getParameter("sup_id"));
					
					String mrName = request.getParameter("rsup_mr");
					String engName = request.getParameter("rsup_eng");
					String uPass = request.getParameter("usr_pass");
					String conNo = request.getParameter("contact_no");
					
				
					System.err.println("Marathi name  " +mrName);
					RouteSup rSup=new RouteSup();
					
					rSup.setIsBlock(1);
					rSup.setIsUsed(1);
					rSup.setSupContactNo(conNo);
					rSup.setSupEngName(engName);
					rSup.setSupId(supId);
					rSup.setSupMarName(mrName);
					rSup.setSupPwd(uPass);
					rSup.setToken("dummy token");
					
					RouteSup routeSupInsertRes = rest.postForObject(Constants.url + "saveRouteSup", rSup, RouteSup.class);

				}catch (Exception e) {
					System.err.println("Exception in /insertRouteSup ->saveRouteSup @MastContr  " + e.getMessage());
					e.printStackTrace();
				}
				return "redirect:/showAddRouteSupervisor";
		}
			
			//getEditRouteSup -ajax
			
			@RequestMapping(value = "/getEditRouteSup", method = RequestMethod.GET)
			public @ResponseBody RouteSup getEditRouteSupMethod(HttpServletRequest request, HttpServletResponse response) {
				RouteSup routeSUpEdit = null;

				try {
					
					int supId = Integer.parseInt(request.getParameter("supId"));
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					map.add("supId", supId);
					
					routeSUpEdit = rest.postForObject(Constants.url + "getRsBySupId", map, RouteSup.class);

				} catch (Exception e) {

					e.printStackTrace();
				}

				return routeSUpEdit;

			}
			
			//deleteRouteSup
			
			@RequestMapping(value = "/deleteRouteSup/{supId}", method =RequestMethod.GET)
			public String deleteRouteSupMethod(HttpServletRequest request, HttpServletResponse response,@PathVariable int supId) {
				
				try {

					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					map.add("supId", supId);
					
					ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteRouteSup", map, ErrorMessage.class);

				} catch (Exception e) {

					System.err.println("Exception in /deleteRouteSup @MastContr  " + e.getMessage());
					e.printStackTrace();
				}

				return "redirect:/showAddRouteSupervisor";

			}
			
			
			//showAddRoute
			@RequestMapping(value = "/showAddRoute", method = RequestMethod.GET)
			public ModelAndView showAddRouteMethod(HttpServletRequest request, HttpServletResponse response) {

				ModelAndView model = null;
				try {

					model = new ModelAndView("masters/addroute");
					
					
					Locale locale = LocaleContextHolder.getLocale();

					// System.err.println("current language is - " + locale.toString());

					int langSelected = 0;

					if (locale.toString().equalsIgnoreCase("mr")) {
						langSelected = 1;
					}

					model.addObject("langSelected", langSelected);

					//getAllHubByIsUsed
					Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
					hubList = new ArrayList<Hub>(Arrays.asList(hubRes));
					
					model.addObject("hubList", hubList);
					
					//getAllMSByIsUsed
					GetRoute[] routeRes = rest.getForObject(Constants.url + "getAllGetRouteByIsUsed", GetRoute[].class);
					routeList = new ArrayList<GetRoute>(Arrays.asList(routeRes));
					
					model.addObject("routeList", routeList);
					
				} catch (Exception e) {

					e.printStackTrace();
				}

				return model;

			}
			
			//insertRoute
			
			@RequestMapping(value = "/insertRoute", method = RequestMethod.POST)
			public String insertRouteMethod(HttpServletRequest request, HttpServletResponse response) {
				
				try {

					int routeId = Integer.parseInt(request.getParameter("route_id"));
					
					String mrName = request.getParameter("route_mr");
					String engName = request.getParameter("route_eng");
					
					int routeSeqNo=Integer.parseInt(request.getParameter("r_seq_no"));
					int hubId=Integer.parseInt(request.getParameter("sel_hub"));
					
					Route route=new Route();
					
					route.setRouteId(routeId);
					route.setHubId(hubId);
					route.setIsUsed(1);
					route.setRouteEngName(engName);
					route.setRouteMarName(mrName);
					route.setRouteSeqNo(routeSeqNo);
					
					System.err.println("Marathi route name  " +mrName);
					
					Route routeInsertResponse = rest.postForObject(Constants.url + "saveRoute", route, Route.class);

				}catch (Exception e) {
					System.err.println("Exception in /insertRoute ->saveRoute @MastContr  " + e.getMessage());
					e.printStackTrace();
				}
				return "redirect:/showAddRoute";
		}
			
			//getEditRoute-ajax
			@RequestMapping(value = "/getEditRoute", method = RequestMethod.GET)
			public @ResponseBody Route getEditRouteMethod(HttpServletRequest request, HttpServletResponse response) {
				Route routeEdit = null;

				try {
					
					int routeId = Integer.parseInt(request.getParameter("routeId"));
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					map.add("routeId", routeId);
					
					routeEdit = rest.postForObject(Constants.url + "getRouteByRouteId", map, Route.class);

				} catch (Exception e) {

					e.printStackTrace();
				}

				return routeEdit;

			}
			
			//deleteRoute
			@RequestMapping(value = "/deleteRoute/{routeId}", method =RequestMethod.GET)
			public String deleteRouteMethod(HttpServletRequest request, HttpServletResponse response,@PathVariable int routeId) {
				
				try {

					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					map.add("routeId", routeId);
					
					ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteRoute", map, ErrorMessage.class);

				} catch (Exception e) {

					System.err.println("Exception in /deleteRoute @MastContr  " + e.getMessage());
					e.printStackTrace();
				}

				return "redirect:/showAddRoute";

			}
			
			
}

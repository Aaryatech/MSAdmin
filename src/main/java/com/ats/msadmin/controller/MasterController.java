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
import javax.swing.plaf.basic.BasicComboBoxUI.ItemHandler;

import org.apache.commons.io.FilenameUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
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
import com.ats.msadmin.model.master.Driver;
import com.ats.msadmin.model.master.ErrorMessage;
import com.ats.msadmin.model.master.GetItemName;
import com.ats.msadmin.model.master.GetRoute;
import com.ats.msadmin.model.master.Hub;
import com.ats.msadmin.model.master.Item;
import com.ats.msadmin.model.master.ItemHsn;
import com.ats.msadmin.model.master.Route;
import com.ats.msadmin.model.master.Uom;
import com.ats.msadmin.model.master.Vehicle;
import com.ats.msadmin.model.user.MahasanghUser;

@Controller
@Scope("session")
public class MasterController {
	RestTemplate rest = new RestTemplate();
	//

	List<Category> catList;
	List<Hub> hubList;
	List<MahasanghUser> mhsUsrList;
	List<RouteSup> routeSupList;

	List<GetRoute> routeList;

	List<ItemHsn> iHsnList;

	List<Uom> uomList;

	private ArrayList<GetItemName> itemList;
	private ArrayList<Driver> driverList;
	private ArrayList<Vehicle> vehicleList;

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

	// insertCategory same call for edit

	@RequestMapping(value = "/insertCategory", method = RequestMethod.POST)
	public String insertCategoryMethod(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imgInp") List<MultipartFile> file) {

		try {

			int catId = Integer.parseInt(request.getParameter("cat_id"));

			System.err.println("cat Id  " + catId);
			String catMrName = request.getParameter("catTxtMarathi");
			String catEnName = request.getParameter("catTxtEnglish");

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			String catImage = request.getParameter("prevImage");
			// System.err.println("Prev Image =" +catImage);
			try {
				if (!file.get(0).getOriginalFilename().equalsIgnoreCase("")) {
					VpsImageUpload imgUpload = new VpsImageUpload();

					String tStamp = dateFormat.format(cal.getTime());
					String extension = FilenameUtils.getExtension(file.get(0).getOriginalFilename());

					catImage = new String();
					catImage = tStamp + "." + extension;
					imgUpload.saveUploadedFiles(file, Constants.CAT_FILE_TYPE, catImage);

				}
			} catch (Exception e) {
				System.err.println("Exc in uploading cat Imag " + e.getMessage());
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

	// deleteCategory

	@RequestMapping(value = "/deleteCategory/{catId}", method = RequestMethod.GET)
	public String deleteCategoryMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int catId) {

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

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);

			// getAllCatByIsUsed

			Category[] catRes = rest.getForObject(Constants.url + "getAllCatByIsUsed", Category[].class);
			catList = new ArrayList<Category>(Arrays.asList(catRes));

			model.addObject("catList", catList);

			// getAllItemHsnByIsUsed

			ItemHsn[] itemHsn = rest.getForObject(Constants.url + "getAllItemHsnByIsUsed", ItemHsn[].class);
			iHsnList = new ArrayList<ItemHsn>(Arrays.asList(itemHsn));

			model.addObject("iHsnList", iHsnList);

			// getAllUomByIsUsed

			Uom[] uomRes = rest.getForObject(Constants.url + "getAllUomByIsUsed", Uom[].class);
			uomList = new ArrayList<Uom>(Arrays.asList(uomRes));

			model.addObject("uomList", uomList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertItem

	@RequestMapping(value = "/insertItem", method = RequestMethod.POST)
	public String insertItemMethod(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imgInp") List<MultipartFile> file) {

		try {

			int itemId=0;
			try {
			itemId= Integer.parseInt(request.getParameter("item_id"));
			}catch (Exception e) {
				itemId=0;
			}

			String mrName = request.getParameter("itemMr");
			String engName = request.getParameter("itemEng");

			String mrDesc = request.getParameter("itemDescMr");
			String engDesc = request.getParameter("itemDescEng");

			int catId = Integer.parseInt(request.getParameter("item_cat"));
			int hsnId = Integer.parseInt(request.getParameter("item_hsn"));
			float rate = Float.parseFloat(request.getParameter("item_rate"));
			float mrp = Float.parseFloat(request.getParameter("item_mrp"));
			int uomId = Integer.parseInt(request.getParameter("item_uom"));
			int itemWeight = Integer.parseInt(request.getParameter("item_weight"));

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			String itemImage = request.getParameter("prevImage");
			try {
				if (!file.get(0).getOriginalFilename().equalsIgnoreCase("")) {
					VpsImageUpload imgUpload = new VpsImageUpload();

					String tStamp = dateFormat.format(cal.getTime());
					String extension = FilenameUtils.getExtension(file.get(0).getOriginalFilename());

					itemImage = new String();
					itemImage = tStamp + "." + extension;
					imgUpload.saveUploadedFiles(file, Constants.ITEM_FILE_TYPE, itemImage);

				}
			} catch (Exception e) {
				System.err.println("Exc in uploading item Imag " + e.getMessage());
				e.printStackTrace();

			}

			Item item = new Item();
			item.setItemId(itemId);
			item.setCatId(catId);
			item.setIsUsed(1);
			item.setItemEngDesc(engDesc);
			item.setItemEngName(engName);
			item.setItemHsnId(hsnId);
			item.setItemMarDesc(mrDesc);
			item.setItemMarName(mrName);
			item.setItemMrp(mrp);
			item.setItemPic(itemImage);
			item.setItemRate(rate);
			item.setItemUomId(uomId);
			item.setItemWt(itemWeight);

			System.err.println("Item " + item.toString());

			// saveItem

			Item itemInsertRes = rest.postForObject(Constants.url + "saveItem", item, Item.class);

		} catch (Exception e) {

			System.err.println("Exc in insertItem  " + e.getMessage());
			e.printStackTrace();

		}
		return "redirect:/showItemList";

	}

	//// showItemiIst

	@RequestMapping(value = "/showItemList", method = RequestMethod.GET)
	public ModelAndView showItemListMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("masters/itemlist");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);

			// getAllHubByIsUsed
			GetItemName[] hubRes = rest.getForObject(Constants.url + "getAllItem", GetItemName[].class);
			itemList = new ArrayList<GetItemName>(Arrays.asList(hubRes));

			model.addObject("itemList", itemList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// editItem

	@RequestMapping(value = "/editItem/{itemId}", method = RequestMethod.GET)
	public ModelAndView editItemMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int itemId) {
		ModelAndView model = null;
		try {
			model = new ModelAndView("masters/additem");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("itemId", itemId);

			Item editItem = rest.postForObject(Constants.url + "getItemByItemId", map, Item.class);

			model.addObject("editItem", editItem);

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);

			// getAllCatByIsUsed

			Category[] catRes = rest.getForObject(Constants.url + "getAllCatByIsUsed", Category[].class);
			catList = new ArrayList<Category>(Arrays.asList(catRes));

			model.addObject("catList", catList);

			// getAllItemHsnByIsUsed

			ItemHsn[] itemHsn = rest.getForObject(Constants.url + "getAllItemHsnByIsUsed", ItemHsn[].class);
			iHsnList = new ArrayList<ItemHsn>(Arrays.asList(itemHsn));

			model.addObject("iHsnList", iHsnList);

			// getAllUomByIsUsed

			Uom[] uomRes = rest.getForObject(Constants.url + "getAllUomByIsUsed", Uom[].class);
			uomList = new ArrayList<Uom>(Arrays.asList(uomRes));

			model.addObject("uomList", uomList);
			model.addObject("imgUrl", Constants.ITEM_FOLDER);

		} catch (Exception e) {

			System.err.println("Exception in /editItem{itemId} @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	// deleteItem

	@RequestMapping(value = "/deleteItem/{itemId}", method = RequestMethod.GET)
	public String deleteItemMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int itemId) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("itemId", itemId);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteItem", map, ErrorMessage.class);

		} catch (Exception e) {

			System.err.println("Exception in /deleteCategory @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddCat";

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

			// getAllHubByIsUsed
			Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
			hubList = new ArrayList<Hub>(Arrays.asList(hubRes));

			model.addObject("hubList", hubList);

			// getAllMSByIsUsed
			MahasanghUser[] mhsUsr = rest.getForObject(Constants.url + "getAllMSByIsUsed", MahasanghUser[].class);
			mhsUsrList = new ArrayList<MahasanghUser>(Arrays.asList(mhsUsr));

			model.addObject("mhsUsrList", mhsUsrList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertMsUser
	@RequestMapping(value = "/insertMsUser", method = RequestMethod.POST)
	public String insertMsUserMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int msId = Integer.parseInt(request.getParameter("ms_id"));

			String mrName = request.getParameter("usrname_mr");
			String engName = request.getParameter("usrname_eng");
			String uPass = request.getParameter("usr_pass");
			String conNo = request.getParameter("contact_no");

			int role = Integer.parseInt(request.getParameter("usr_role"));

			String[] selHub = request.getParameterValues("sel_hub");
			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < selHub.length; i++) {
				sb = sb.append(selHub[i] + ",");

			}
			String hubs = sb.toString();
			hubs = hubs.substring(0, hubs.length() - 1);
			System.out.println("hubs" + hubs);

			MahasanghUser msUser = new MahasanghUser();
			msUser.setMsId(msId);
			msUser.setHubIds(hubs);
			msUser.setIsAdmin(role);
			msUser.setIsBlock(1);
			msUser.setIsUsed(1);
			msUser.setMsContactNo(conNo);
			msUser.setMsEngName(engName);
			msUser.setMsMarName(mrName);
			msUser.setMsPwd(uPass);

			System.err.println("Marathi name  " + mrName);

			MahasanghUser msUserInsertResponse = rest.postForObject(Constants.url + "saveMahasnaghUser", msUser,
					MahasanghUser.class);

		} catch (Exception e) {
			System.err.println("Exception in /insertMsUser ->saveMahasnaghUser @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddMSUser";
	}

	// getEditMsUser- aJax

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

	// deleteMsUser

	@RequestMapping(value = "/deleteMsUser/{msId}", method = RequestMethod.GET)
	public String deleteMsUserMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int msId) {

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

	// showAddHub
	@RequestMapping(value = "/showAddHub", method = RequestMethod.GET)
	public ModelAndView showAddHubMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			HttpSession session = request.getSession();

			MahasanghUser user = (MahasanghUser) session.getAttribute("user");
			System.err.println("USer From Session :  " + user.toString());

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

	// insertHub
	@RequestMapping(value = "/insertHub", method = RequestMethod.POST)
	public String insertHubMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int hubId = Integer.parseInt(request.getParameter("hub_id"));

			String mrName = request.getParameter("hname_mr");
			String engName = request.getParameter("hname_eng");
			String hAdddMr = request.getParameter("hadd_mr");
			String hAdddEng = request.getParameter("hadd_eng");
			String conNo = request.getParameter("contact_no");

			Hub hub = new Hub();

			hub.setHubContactNo(conNo);
			hub.setHubEngAdd(hAdddEng);
			hub.setHubEngName(engName);
			hub.setHubId(hubId);
			hub.setHubMarAdd(hAdddMr);
			hub.setHubMarName(mrName);
			hub.setIsUsed(1);

			System.err.println("Marathi name  " + mrName);

			Hub hubInsertResponse = rest.postForObject(Constants.url + "saveHub", hub, Hub.class);

		} catch (Exception e) {
			System.err.println("Exception in /insertHub ->saveHub @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddHub";
	}

	// getEditHub- ajax

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

	// deleteHub

	@RequestMapping(value = "/deleteHub/{hubId}", method = RequestMethod.GET)
	public String deleteHubMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int hubId) {

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

	// showAddRouteSupervisor

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

	// insertRouteSup

	@RequestMapping(value = "/insertRouteSup", method = RequestMethod.POST)
	public String insertRouteSupMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int supId = Integer.parseInt(request.getParameter("sup_id"));

			String mrName = request.getParameter("rsup_mr");
			String engName = request.getParameter("rsup_eng");
			String uPass = request.getParameter("usr_pass");
			String conNo = request.getParameter("contact_no");

			System.err.println("Marathi name  " + mrName);
			RouteSup rSup = new RouteSup();

			rSup.setIsBlock(1);
			rSup.setIsUsed(1);
			rSup.setSupContactNo(conNo);
			rSup.setSupEngName(engName);
			rSup.setSupId(supId);
			rSup.setSupMarName(mrName);
			rSup.setSupPwd(uPass);
			rSup.setToken("dummy token");

			RouteSup routeSupInsertRes = rest.postForObject(Constants.url + "saveRouteSup", rSup, RouteSup.class);

		} catch (Exception e) {
			System.err.println("Exception in /insertRouteSup ->saveRouteSup @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddRouteSupervisor";
	}

	// getEditRouteSup -ajax

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

	// deleteRouteSup

	@RequestMapping(value = "/deleteRouteSup/{supId}", method = RequestMethod.GET)
	public String deleteRouteSupMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int supId) {

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

	// showAddRoute
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

			// getAllHubByIsUsed
			Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
			hubList = new ArrayList<Hub>(Arrays.asList(hubRes));

			model.addObject("hubList", hubList);

			// getAllMSByIsUsed
			GetRoute[] routeRes = rest.getForObject(Constants.url + "getAllGetRouteByIsUsed", GetRoute[].class);
			routeList = new ArrayList<GetRoute>(Arrays.asList(routeRes));

			model.addObject("routeList", routeList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertRoute

	@RequestMapping(value = "/insertRoute", method = RequestMethod.POST)
	public String insertRouteMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int routeId = Integer.parseInt(request.getParameter("route_id"));

			String mrName = request.getParameter("route_mr");
			String engName = request.getParameter("route_eng");

			int routeSeqNo = Integer.parseInt(request.getParameter("r_seq_no"));
			int hubId = Integer.parseInt(request.getParameter("sel_hub"));

			Route route = new Route();

			route.setRouteId(routeId);
			route.setHubId(hubId);
			route.setIsUsed(1);
			route.setRouteEngName(engName);
			route.setRouteMarName(mrName);
			route.setRouteSeqNo(routeSeqNo);

			System.err.println("Marathi route name  " + mrName);

			Route routeInsertResponse = rest.postForObject(Constants.url + "saveRoute", route, Route.class);

		} catch (Exception e) {
			System.err.println("Exception in /insertRoute ->saveRoute @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddRoute";
	}

	// getEditRoute-ajax
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

	// deleteRoute
	@RequestMapping(value = "/deleteRoute/{routeId}", method = RequestMethod.GET)
	public String deleteRouteMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int routeId) {

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

	// showAddItemHsn
	@RequestMapping(value = "/showAddItemHsn", method = RequestMethod.GET)
	public ModelAndView showAddItemHsnMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			ItemHsn[] catRes = rest.getForObject(Constants.url + "getAllItemHsnByIsUsed", ItemHsn[].class);
			iHsnList = new ArrayList<ItemHsn>(Arrays.asList(catRes));

			model = new ModelAndView("masters/addhsncode");
			model.addObject("langSelected", langSelected);

			model.addObject("iHsnList", iHsnList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}
	// insertHsnCode

	@RequestMapping(value = "/insertHsnCode", method = RequestMethod.POST)
	public String insertHsnCodeMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int hsnId = Integer.parseInt(request.getParameter("hsn_id"));
			System.err.println("hsnId Id  " + hsnId);
			String hsnCode = request.getParameter("hsn_code");

			float cgst = Float.parseFloat(request.getParameter("cgst"));
			float sgst = Float.parseFloat(request.getParameter("sgst"));
			float igst = Float.parseFloat(request.getParameter("igst"));

			ItemHsn hsn = new ItemHsn();
			hsn.setItemHsnId(hsnId);

			hsn.setIsUsed(1);
			hsn.setItemCgst(cgst);
			hsn.setItemHsnCode(hsnCode);
			hsn.setItemIgst(igst);
			hsn.setItemSgst(sgst);

			ItemHsn itemHsnInsertResponse = rest.postForObject(Constants.url + "saveItemHsn", hsn, ItemHsn.class);

		} catch (Exception e) {

			System.err.println("Exception in /insertHsnCode @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddItemHsn";

	}

	// getEditHsnCode
	// getEditRoute-ajax
	@RequestMapping(value = "/getEditHsnCode", method = RequestMethod.GET)
	public @ResponseBody ItemHsn getEditHsnCodeMethod(HttpServletRequest request, HttpServletResponse response) {
		ItemHsn hsnCodeEdit = null;

		try {

			int hsnId = Integer.parseInt(request.getParameter("hsnId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("itemHsnId", hsnId);

			hsnCodeEdit = rest.postForObject(Constants.url + "getItemHsnByItemHsnId", map, ItemHsn.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return hsnCodeEdit;

	}

	// deleteHsn
	@RequestMapping(value = "/deleteHsn/{hsnId}", method = RequestMethod.GET)
	public String deleteHsnMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int hsnId) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("itemHsnId", hsnId);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteItemHsn", map, ErrorMessage.class);

		} catch (Exception e) {

			System.err.println("Exception in /deleteHsn @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddItemHsn";

	}

	// showAddUom

	@RequestMapping(value = "/showAddUom", method = RequestMethod.GET)
	public ModelAndView showAddUomMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model = new ModelAndView("masters/adduom");

			Uom[] uomRes = rest.getForObject(Constants.url + "getAllUomByIsUsed", Uom[].class);
			uomList = new ArrayList<Uom>(Arrays.asList(uomRes));

			model.addObject("uomList", uomList);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertUom

	@RequestMapping(value = "/insertUom", method = RequestMethod.POST)
	public String insertUomMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int uomId = Integer.parseInt(request.getParameter("uom_id"));

			String uomName = request.getParameter("uom_name");

			System.err.println("Marathi uomName   " + uomName);

			Uom uom = new Uom();

			uom.setIsUsed(1);
			uom.setUomId(uomId);
			uom.setUomName(uomName);

			// saveUom

			Uom uomInsertResponse = rest.postForObject(Constants.url + "saveUom", uom, Uom.class);

		} catch (Exception e) {
			System.err.println("Exception in /insertUom ->saveUom @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddUom";
	}

	// getEditUom- aJax

	@RequestMapping(value = "/getEditUom", method = RequestMethod.GET)
	public @ResponseBody Uom getEditUomMethod(HttpServletRequest request, HttpServletResponse response) {
		Uom uomEdit = null;

		try {

			int uomId = Integer.parseInt(request.getParameter("uomId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("uomId", uomId);

			uomEdit = rest.postForObject(Constants.url + "getUomByUomId", map, Uom.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return uomEdit;

	}

	// deleteUom

	@RequestMapping(value = "/deleteUom/{uomId}", method = RequestMethod.GET)
	public String deleteUomrMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int uomId) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("uomId", uomId);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteUom", map, ErrorMessage.class);

		} catch (Exception e) {

			System.err.println("Exception in /deleteUom @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddUom";

	}

	// showAddDriver

	@RequestMapping(value = "/showAddDriver", method = RequestMethod.GET)
	public ModelAndView showAddDriverMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}


			Driver[] catRes = rest.getForObject(Constants.url + "getAllDriverByIsUsed", Driver[].class);
			driverList = new ArrayList<Driver>(Arrays.asList(catRes));

			model = new ModelAndView("masters/driver");
			
			model.addObject("langSelected", langSelected);
			model.addObject("driverList", driverList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertDriver
	@RequestMapping(value = "/insertDriver", method = RequestMethod.POST)
	public String insertDriverMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int driverId = Integer.parseInt(request.getParameter("driver_id"));

			String mrName = request.getParameter("drname_mr");
			String engName = request.getParameter("drname_eng");
			String conNo = request.getParameter("contact_no");

			Driver driver = new Driver();

			driver.setDriverContactNo(conNo);
			driver.setDriverEngName(engName);
			driver.setDriverId(driverId);
			driver.setDriverMarName(mrName);
			driver.setIsUsed(1);
			
			System.err.println(" driver Marathi name  " + mrName);

			Driver driverRes = rest.postForObject(Constants.url + "saveDriver", driver, Driver.class);

		} catch (Exception e) {
			System.err.println("Exception in /insertDriver ->saveDriver @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAddDriver";
	}
	
	//getEditDriver
	
	@RequestMapping(value = "/getEditDriver", method = RequestMethod.GET)
	public @ResponseBody Driver getEditDriverMethod(HttpServletRequest request, HttpServletResponse response) {
		Driver driverEdit = null;

		try {
			int driverId = Integer.parseInt(request.getParameter("driverId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("driverId", driverId);
			driverEdit = rest.postForObject(Constants.url + "getDriverByDriverId", map, Driver.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return driverEdit;

	}
	

	// deleteDriver
		@RequestMapping(value = "/deleteDriver/{driverId}", method = RequestMethod.GET)
		public String deleteDriverMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int driverId) {

			try {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("driverId", driverId);

		 		ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteDriver", map, ErrorMessage.class);

			} catch (Exception e) {

				System.err.println("Exception in /deleteDriver @MastContr  " + e.getMessage());
				e.printStackTrace();
			}

			return "redirect:/showAddDriver";

		}


	// showAddVehicle

	@RequestMapping(value = "/showAddVehicle", method = RequestMethod.GET)
	public ModelAndView showAddVehicleMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}


			Vehicle[] vehRes = rest.getForObject(Constants.url + "getAllVehByIsUsed", Vehicle[].class);
			vehicleList = new ArrayList<Vehicle>(Arrays.asList(vehRes));

			model = new ModelAndView("masters/vehicle");
			model.addObject("langSelected", langSelected);

			model.addObject("vehicleList", vehicleList);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertVehicle
		@RequestMapping(value = "/insertVehicle", method = RequestMethod.POST)
		public String insertVehicleMethod(HttpServletRequest request, HttpServletResponse response) {

			try {

				int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));

				String vehNo = request.getParameter("veh_no");
				int vehOwnBy = Integer.parseInt(request.getParameter("veh_owner"));
				String vehSerFrom = request.getParameter("veh_ser_from");

				Vehicle vehicle = new Vehicle();
				
				vehicle.setIsUsed(1);
				vehicle.setVehicleId(vehicleId);
				vehicle.setVehicleInServiceFrom(vehSerFrom);
				vehicle.setVehicleNo(vehNo);
				vehicle.setVehicleOwnedBy(vehOwnBy);
				
				Vehicle vehRes = rest.postForObject(Constants.url + "saveVehicle", vehicle, Vehicle.class);

			} catch (Exception e) {
				System.err.println("Exception in /insertVehicle ->saveVehicle @MastContr  " + e.getMessage());
				e.printStackTrace();
			}
			return "redirect:/showAddVehicle";
		}
		
		//getEditVehicle
		
		@RequestMapping(value = "/getEditVehicle", method = RequestMethod.GET)
		public @ResponseBody Vehicle getEditVehicleMethod(HttpServletRequest request, HttpServletResponse response) {
			Vehicle vehicleEdit = null;

			try {
				int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("vehicleId", vehicleId);
				vehicleEdit = rest.postForObject(Constants.url + "getVehicleByVehId", map, Vehicle.class);

			} catch (Exception e) {

				e.printStackTrace();
			}

			return vehicleEdit;

		}
		

		// deleteVehicle
			@RequestMapping(value = "/deleteVehicle/{vehicleId}", method = RequestMethod.GET)
			public String deleteVehicleMethod(HttpServletRequest request, HttpServletResponse response, @PathVariable int vehicleId) {

				try {

					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

					map.add("vehicleId", vehicleId);

					ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteVehicle", map, ErrorMessage.class);

				} catch (Exception e) {

					System.err.println("Exception in /deleteVehicle @MastContr  " + e.getMessage());
					e.printStackTrace();
				}

				return "redirect:/showAddVehicle";

			}

}

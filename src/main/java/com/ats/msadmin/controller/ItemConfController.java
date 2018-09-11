package com.ats.msadmin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.crypto.SealedObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.common.DateConvertor;
import com.ats.msadmin.model.master.Category;
import com.ats.msadmin.model.master.Config;
import com.ats.msadmin.model.master.ErrorMessage;
import com.ats.msadmin.model.master.GetItemName;
import com.ats.msadmin.model.master.GetSetting;
import com.ats.msadmin.model.master.Hub;
import com.ats.msadmin.model.master.Setting;
import com.ats.msadmin.model.user.MahasanghUser;

@Controller
@Scope("session")
public class ItemConfController {

	RestTemplate rest = new RestTemplate();

	List<Hub> hubList;
	private ArrayList<GetItemName> itemList;
 
	private ArrayList<Config> confList;

	private ArrayList<GetSetting> settingList;

	private String convertTimeFormat(String inputTime) {

		SimpleDateFormat displayFormat = new SimpleDateFormat("hh:mm a");
		SimpleDateFormat parseFormat = new SimpleDateFormat("hh:mm:ss");
		Date date = null;
		try {
			date = parseFormat.parse(inputTime);
		} catch (ParseException e) {
			//System.err.println("Exce in convertTimeFormat  " + e.getMessage());
			e.printStackTrace();
		}
		//System.out.println("convertTimeFormat" + parseFormat.format(date) + " = " + displayFormat.format(date));

		return displayFormat.format(date);
	}

	@RequestMapping(value = "/showCreateItemConf", method = RequestMethod.GET)
	public ModelAndView showCreateItemConfMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("itemconf/createconf");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			GetItemName[] hubRes = rest.getForObject(Constants.url + "getAllItem", GetItemName[].class);
			itemList = new ArrayList<GetItemName>(Arrays.asList(hubRes));
			
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String date = sdf.format(now.getTime());
			model.addObject("date", date);
			

			model.addObject("itemList", itemList);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// insertItemConf
	@RequestMapping(value = "/insertItemConf", method = RequestMethod.POST)
	public String insertItemConfMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("itemconf/createconf");

			String mrName = request.getParameter("confMr");
			String engName = request.getParameter("confEng");

			String[] selItems = request.getParameterValues("items[]");
			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < selItems.length; i++) {
				sb = sb.append(selItems[i] + ",");

			}

			String itemIds = sb.toString();
			itemIds = itemIds.substring(0, itemIds.length() - 1);
			System.out.println("itemIds" + itemIds);

			String confDetail = "Daily";
			int confType = Integer.parseInt(request.getParameter("conf_type"));
			if (confType == 1) {

				confDetail = request.getParameter("date");
				confDetail = DateConvertor.convertToYMD(confDetail);
				System.out.println("confDetail-1 " + confDetail);
			} else if (confType == 2) {
				String[] selDays = request.getParameterValues("days[]");
				sb = new StringBuilder();

				for (int i = 0; i < selDays.length; i++) {
					sb = sb.append(selDays[i] + ",");
				}

				confDetail = sb.toString();
				confDetail = confDetail.substring(0, confDetail.length() - 1);
				System.out.println("confDetail-2  " + confDetail);
			}

			// int itemWeight=Integer.parseInt(request.getParameter("item_weight"));

			String dFT = request.getParameter("disFTime");
			String dTT = request.getParameter("disTTime");

			String hFT = request.getParameter("hubFTime");
			String hTT = request.getParameter("hubTTime");
			System.err.println("Timing before  " + "dFT =" + dFT + "dTT =" + dTT + "hFT =" + hFT + "hTT =" + hTT);

			/*dFT = convertTimeFormat(dFT);
			dTT = convertTimeFormat(dTT);
			hFT = convertTimeFormat(hFT);
			hTT = convertTimeFormat(hTT);
			System.err.println("Timing " + "dFT= " + dFT + "dTT =" + dTT + "hFT =" + hFT + "hTT =" + hTT);
*/
			// saveConfig

			Config config = new Config();
			config.setConfigEngName(engName);
			config.setConfigMarName(mrName);
			config.setItemIds(itemIds);
			config.setConfigType(confType);
			config.setConfigTypeDetails(confDetail);
			config.setDistFromTime(dFT+":00");
			config.setDistToTime(dTT+":00");
			config.setHubFromTime(hFT+":00");
			config.setHubToTime(hTT+":00");
			config.setIsUsed(1);

			Config configInsertResponse = rest.postForObject(Constants.url + "saveConfig", config, Config.class);

		} catch (Exception e) {

			System.err.println("Exce in insertItemConf @ ItemConfContr " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showConfList";
	}

	// showConfList

	@RequestMapping(value = "/showConfList", method = RequestMethod.GET)
	public ModelAndView showConfListMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("itemconf/confList");

			Locale locale = LocaleContextHolder.getLocale();

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			model.addObject("langSelected", langSelected);

			// getAllConfigByIsUsed

			Config[] confRes = rest.getForObject(Constants.url + "getAllConfigByIsUsed", Config[].class);
			confList = new ArrayList<Config>(Arrays.asList(confRes));
			
			for(int i=0;i<confList.size();i++) {
				
				confList.get(i).setDistFromTime(convertTimeFormat(confList.get(i).getDistFromTime()));
				confList.get(i).setDistToTime(convertTimeFormat(confList.get(i).getDistToTime()));
				confList.get(i).setHubFromTime(convertTimeFormat(confList.get(i).getHubFromTime()));
				confList.get(i).setHubToTime(convertTimeFormat(confList.get(i).getHubToTime()));
				
			}

			model.addObject("confList", confList);

		} catch (Exception e) {

			System.err.println("Exception in showConfList " + e.getMessage());
			e.printStackTrace();
		}
		return model;
	}

	// showAssignConf
	@RequestMapping(value = "/showAssignConf", method = RequestMethod.GET)
	public ModelAndView showAssignConffMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("itemconf/assignConf");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);

			Config[] confRes = rest.getForObject(Constants.url + "getAllConfigByIsUsed", Config[].class);
			confList = new ArrayList<Config>(Arrays.asList(confRes));

			model.addObject("confList", confList);

			// getAllHubByIsUsed
			Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
			hubList = new ArrayList<Hub>(Arrays.asList(hubRes));

			model.addObject("hubList", hubList);

			// getSettingHubName
			GetSetting[] setRes = rest.getForObject(Constants.url + "getSettingHubName", GetSetting[].class);
			settingList = new ArrayList<GetSetting>(Arrays.asList(setRes));

			model.addObject("settingList", settingList);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return model;
	}

	// assignConf insert into t_setting

	@RequestMapping(value = "/assignConf", method = RequestMethod.POST)
	public String assignConfMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			int confId = Integer.parseInt(request.getParameter("sel_conf"));

			String[] selHub = request.getParameterValues("sel_hub[]");
			StringBuilder sb = new StringBuilder();

			List<Integer> hubIds = new ArrayList<Integer>();

			for (int i = 0; i < selHub.length; i++) {
				sb = sb.append(selHub[i] + ",");

				hubIds.add(Integer.parseInt(selHub[i]));
			}
			String hubs = sb.toString();
			hubs = hubs.substring(0, hubs.length() - 1);
			System.out.println("hubs" + hubs);
			System.out.println("hubIds List" + hubIds);
			
			List<Setting> setList=new ArrayList<Setting>();
			
 			if (hubIds.size() > 0) {
				for (int i = 0; i < hubIds.size(); i++) {

					Setting setting = new Setting();
					setting.setConfigId(confId);
					setting.setHubId(hubIds.get(i));
					setting.setIsUsed(1);
					setList.add(setting);
					
				} // end of for

			} // end of if size >0
 			
 			ErrorMessage saveSettingList = rest.postForObject(Constants.url + "saveSettingList", setList,
 					ErrorMessage.class);
 			
		} catch (Exception e) {
			System.err.println("Exception in /insertMsUser ->saveMahasnaghUser @MastContr  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showAssignConf";
	}
	
	
	
	
	
	@RequestMapping(value = "/delAssignedConf/{setId}", method = RequestMethod.GET)
	public String delAssignedConfMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int setId) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("settingId", setId);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "deleteSetting", map, ErrorMessage.class);

		} catch (Exception e) {

			System.err.println("Exception in /delAssignedConf @ItemConfController  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAssignConf";

	}

}
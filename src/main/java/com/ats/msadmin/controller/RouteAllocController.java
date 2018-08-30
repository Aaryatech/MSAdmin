package com.ats.msadmin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.common.DateConvertor;
import com.ats.msadmin.model.master.Category;
import com.ats.msadmin.model.master.Driver;
import com.ats.msadmin.model.master.GetRoute;
import com.ats.msadmin.model.master.Vehicle;

@Controller
public class RouteAllocController {
	RestTemplate rest = new RestTemplate();
	
	List<GetRoute> routeList;
	private ArrayList<Driver> driverList;
	private ArrayList<Vehicle> vehicleList;
	List<RouteSup> routeSupList;
	@RequestMapping(value = "/showRouteAllocation", method = RequestMethod.GET)
	public ModelAndView showAddCatMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			
			model = new ModelAndView("routeAlloc/allocateroute");


			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			GetRoute[] routeRes = rest.getForObject(Constants.url + "getAllGetRouteByIsUsed", GetRoute[].class);
			routeList = new ArrayList<GetRoute>(Arrays.asList(routeRes));

			model.addObject("routeList", routeList);
			
			RouteSup[] rSupRes = rest.getForObject(Constants.url + "getAllRsByIsUsed", RouteSup[].class);
			routeSupList = new ArrayList<RouteSup>(Arrays.asList(rSupRes));
			model.addObject("routeSupList", routeSupList);


			model.addObject("langSelected", langSelected);

			model.addObject("catImageUrl", Constants.CAT_FOLDER);


		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}
	
	//getRouteAllocData
	
	@RequestMapping(value = "/getRouteAllocData", method = RequestMethod.GET)
	public @ResponseBody List<GetRoute> getRouteData(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			
			model = new ModelAndView("routeAlloc/allocateroute");


			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			String fromDate=request.getParameter("from_date");
			String toDate=request.getParameter("to_date");


			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			GetRoute[] routeRes = rest.postForObject(Constants.url + "getRouteBetDate",map, GetRoute[].class);
			routeList = new ArrayList<GetRoute>(Arrays.asList(routeRes));


		} catch (Exception e) {

			e.printStackTrace();
		}

		return routeList;

	}
	
	


}

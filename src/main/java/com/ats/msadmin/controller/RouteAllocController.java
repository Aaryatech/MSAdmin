package com.ats.msadmin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.common.DateConvertor;
import com.ats.msadmin.model.master.DatewiseRoute;
import com.ats.msadmin.model.master.Driver;
import com.ats.msadmin.model.master.GetRoute;
import com.ats.msadmin.model.master.RouteAlloCommonBean;
import com.ats.msadmin.model.master.RouteAllocation;
import com.ats.msadmin.model.master.RouteAllocationWithName;
import com.ats.msadmin.model.master.Vehicle;

@Scope("session")
@Controller
public class RouteAllocController {
	RestTemplate rest = new RestTemplate();

	List<GetRoute> routeList;
	List<Driver> driverList;
	List<Vehicle> vehicleList;
	List<RouteSup> routeSupList;
	
	List<DatewiseRoute> datewiseRouteList;
	

	@RequestMapping(value = "/showAddRouteAllocation", method = RequestMethod.GET)
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

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// getRouteAllocData

	@RequestMapping(value = "/getRouteAllocData", method = RequestMethod.GET)
	public @ResponseBody RouteAlloCommonBean getRouteData(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		RouteAlloCommonBean rAllComBean = new RouteAlloCommonBean();

		try {
			model = new ModelAndView("routeAlloc/allocateroute");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			String fromDate = request.getParameter("from_date");
			String toDate = request.getParameter("to_date");
			System.err.println("From Date  " + fromDate);
			System.err.println("toDate Date  " + toDate);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));
			
			//map.add("fromDate", fromDate);
			//map.add("toDate", toDate);

			GetRoute[] routeRes = rest.postForObject(Constants.url + "getRouteBetDate", map, GetRoute[].class);
			routeList = new ArrayList<GetRoute>(Arrays.asList(routeRes));

			Vehicle[] vehRes = rest.postForObject(Constants.url + "getVehicleBetDate", map, Vehicle[].class);
			vehicleList = new ArrayList<Vehicle>(Arrays.asList(vehRes));

			RouteSup[] rSupRes = rest.postForObject(Constants.url + "getSupBetDate", map, RouteSup[].class);
			routeSupList = new ArrayList<RouteSup>(Arrays.asList(rSupRes));

			Driver[] catRes = rest.postForObject(Constants.url + "getDriverBetDate", map, Driver[].class);
			driverList = new ArrayList<Driver>(Arrays.asList(catRes));

			rAllComBean.setDriverList(driverList);
			rAllComBean.setRouteList(routeList);
			rAllComBean.setRouteSupList(routeSupList);
			rAllComBean.setVehicleList(vehicleList);
			System.err.println("rAllComBean " + rAllComBean.toString());
		} catch (Exception e) {
			
			System.err.println("Exce in Ajax -getRouteAllocData " + e.getMessage());
			e.printStackTrace();
		}

		return rAllComBean;

	}

	// insertRouteAlloc
	
	
	@RequestMapping(value = "/insertRouteAlloc", method = RequestMethod.POST)
	public String insertRouteAllocMethod(HttpServletRequest request, HttpServletResponse response) {

		try {
				
		//when edit get this	
			int trId=0;
			try {
			trId = Integer.parseInt(request.getParameter("tr_id"));
			}catch (Exception e) {
				trId=0;
				
			}
			//System.err.println("cat Id  " + catId);
			
			String fromDate = request.getParameter("from_date");
			String toDate = request.getParameter("to_date");
			System.err.println("From Date  " + fromDate);
			int routeId = Integer.parseInt(request.getParameter("route_name"));
			int vehicleId = Integer.parseInt(request.getParameter("veh_no"));
			int supId = Integer.parseInt(request.getParameter("sup_name"));
			int driverId = Integer.parseInt(request.getParameter("driver_name"));
			
			RouteAllocation routeAllo=new RouteAllocation();
			
			routeAllo.setFromDate(DateConvertor.convertToYMD(fromDate));
			routeAllo.setToDate(DateConvertor.convertToYMD(toDate));
			
			routeAllo.setTrId(trId);
			//routeAllo.setFromDate(fromDate);
			//routeAllo.setToDate(toDate);
			routeAllo.setRouteId(routeId);
			routeAllo.setSupervisorId(supId);
			routeAllo.setVehicleId(vehicleId);
			routeAllo.setDriverId(driverId);
			
			RouteAllocation routeAllocInsertResponse = rest.postForObject(Constants.url + "saveRouteAllocation", routeAllo, RouteAllocation.class);

		} catch (Exception e) {

			System.err.println("Exception in /insertCategory @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAllocatedRoute";

	}
	
	//showAllocatedRoute list new web service 5 tabs 
	
	@RequestMapping(value = "/showAllocatedRoute", method = RequestMethod.GET)
	public ModelAndView showAllocatedRouteMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("routeAlloc/alcroutelist");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);
			
			//getRouteAllocationDatewise
			
			DatewiseRoute[] dateWiseRouteAll = rest.getForObject(Constants.url + "getRouteAllocationDatewise",  DatewiseRoute[].class);
			datewiseRouteList = new ArrayList<DatewiseRoute>(Arrays.asList(dateWiseRouteAll));
			
			for(int i=0;i<datewiseRouteList.size();i++) {
				
				datewiseRouteList.get(i).setCurrDate(DateConvertor.convertToDMY(datewiseRouteList.get(i).getCurrDate()));
				
			}

			model.addObject("datewiseRouteList",datewiseRouteList);
			System.err.println("datewiseRouteList " +datewiseRouteList.toString());
			
		} catch (Exception e) {

			e.printStackTrace();
		} 

		return model;

	}

	
	//editRoutealloc
	
	@RequestMapping(value = "/editRoutealloc/{trId}", method = RequestMethod.GET)
	public ModelAndView editRouteallocMethod(HttpServletRequest request, HttpServletResponse response,@PathVariable int trId) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("routeAlloc/allocateroute");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);
			
			RouteAllocationWithName rAlWithName=null;

			
			for(DatewiseRoute d : datewiseRouteList) {
			
			for(int i=0;i<d.getRouteAllocationList().size();i++) {
				
				if(d.getRouteAllocationList().get(i).getTrId()==trId) {
					
					rAlWithName=new RouteAllocationWithName();
					 rAlWithName=d.getRouteAllocationList().get(i);
						System.err.println("List object "+d.getRouteAllocationList().get(i).toString()); 

					break;
				}
				
			}//end of for
			}

			System.err.println("RAWN BEAN "+rAlWithName.toString()); 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			//map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			//map.add("toDate", DateConvertor.convertToYMD(toDate));
			
			map.add("fromDate", rAlWithName.getFromDate());
			map.add("toDate", rAlWithName.getToDate());

			GetRoute[] routeRes = rest.postForObject(Constants.url + "getRouteBetDate", map, GetRoute[].class);
			routeList = new ArrayList<GetRoute>(Arrays.asList(routeRes));
			
			System.err.println("routeList for edit  " +routeList.toString());

			Vehicle[] vehRes = rest.postForObject(Constants.url + "getVehicleBetDate", map, Vehicle[].class);
			vehicleList = new ArrayList<Vehicle>(Arrays.asList(vehRes));
			System.err.println("vehicleList for edit  " +vehicleList.toString());

			RouteSup[] rSupRes = rest.postForObject(Constants.url + "getSupBetDate", map, RouteSup[].class);
			routeSupList = new ArrayList<RouteSup>(Arrays.asList(rSupRes));
			System.err.println("routeSupList for edit  " +routeSupList.toString());

			Driver[] drRes = rest.postForObject(Constants.url + "getDriverBetDate", map, Driver[].class);
			driverList = new ArrayList<Driver>(Arrays.asList(drRes));
			
			System.err.println("driverList for edit  " +driverList.toString());

			
			
			model.addObject("routeList",routeList);
			model.addObject("vehicleList",vehicleList);
			model.addObject("routeSupList",routeSupList);
			model.addObject("driverList",driverList);
			model.addObject("editRouteAll",rAlWithName);
			model.addObject("fromDate",DateConvertor.convertToDMY(rAlWithName.getFromDate()));
			model.addObject("toDate",DateConvertor.convertToDMY(rAlWithName.getToDate()));


		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	
	
}

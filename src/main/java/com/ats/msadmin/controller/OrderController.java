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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.model.master.Category;
import com.ats.msadmin.model.master.Hub;
import com.ats.msadmin.model.order.GetOrder;

@Controller
@Scope("session")
public class OrderController {
	RestTemplate rest = new RestTemplate();
	List<Category> catList;
	List<GetOrder> ordHeaderList;
	List<Hub> hubList;

	@RequestMapping(value = "/showHubOrders", method = RequestMethod.GET)
	public ModelAndView showAddCatMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/orderheader");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			// getAllHubByIsUsed
			Hub[] hubRes = rest.getForObject(Constants.url + "getAllHubByIsUsed", Hub[].class);
			hubList = new ArrayList<Hub>(Arrays.asList(hubRes));

			model.addObject("hubList", hubList);
			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// getOrderHeader
	// getOrderByHubIdStausAndType

	@RequestMapping(value = "/getOrderHeader", method = RequestMethod.POST)
	public ModelAndView getOrderHeaderMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/orderheader");
			
			int hubId=Integer.parseInt(request.getParameter("sel_hub"));
			
			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderStatus", 1);
			map.add("orderType", 0);
			map.add("hubId", hubId);

			// getAllHubByIsUsed
			GetOrder[] orderRes = rest.postForObject(Constants.url + "getOrderByHubIdStausAndType", map,
					GetOrder[].class);
			ordHeaderList = new ArrayList<GetOrder>(Arrays.asList(orderRes));
			System.err.println("ordHeaderList " + ordHeaderList.toString());
			model.addObject("hubList", hubList);
			model.addObject("ordHeaderList", ordHeaderList);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}
	
	
	@RequestMapping(value = "/editOrder/{ordHeaderId}", method = RequestMethod.GET)
	public ModelAndView getOrderDetailForEdit(HttpServletRequest request, HttpServletResponse response,@PathVariable int ordHeaderId) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/orderdetail");
			
					
			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderHeaderId", ordHeaderId);
		
			// getOrderByOrderHeaderId
			GetOrder ordHeadDetail = rest.postForObject(Constants.url + "getOrderByOrderHeaderId", map,
					GetOrder.class);
			//ordHeaderList = new ArrayList<GetOrder>(Arrays.asList(orderRes));
			System.err.println("ordHeadDetail " + ordHeadDetail.toString());
			model.addObject("hubList", hubList);
			model.addObject("ordHeadDetail", ordHeadDetail);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}
	

}

package com.ats.msadmin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import com.ats.msadmin.common.DateConvertor;
import com.ats.msadmin.model.master.Category;
import com.ats.msadmin.model.master.ErrorMessage;
import com.ats.msadmin.model.master.GetOrderHub;
import com.ats.msadmin.model.master.Hub;
import com.ats.msadmin.model.order.EditOrderDataBean;
import com.ats.msadmin.model.order.GetOrder;
import com.ats.msadmin.model.order.GetOrderDetail;

@Controller
@Scope("session")
public class OrderController {
	RestTemplate rest = new RestTemplate();
	List<Category> catList;
	List<GetOrderHub> ordHeaderList;
	List<Hub> hubList;

	GetOrderHub  ordHeadDetail;

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

			int hubId = Integer.parseInt(request.getParameter("sel_hub"));

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

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(now.getTime());
			map.add("date", date);
			// getAllHubByIsUsed
			GetOrderHub[] orderRes = rest.postForObject(Constants.url + "getOrderByHubIdStausAndType", map,
					GetOrderHub[].class);
			ordHeaderList = new ArrayList<GetOrderHub>(Arrays.asList(orderRes));
			System.err.println("ordHeaderList " + ordHeaderList.toString());
			model.addObject("hubList", hubList);
			model.addObject("ordHeaderList", ordHeaderList);

			model.addObject("langSelected", langSelected);
			model.addObject("selectedHub", hubId);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/editOrder/{ordHeaderId}", method = RequestMethod.GET)
	public ModelAndView getOrderDetailForEdit(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int ordHeaderId) {

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
			ordHeadDetail = rest.postForObject(Constants.url + "getOrderByOrderHeaderId", map, GetOrderHub.class);
			// ordHeaderList = new ArrayList<GetOrder>(Arrays.asList(orderRes));
			System.err.println("ordHeadDetail " + ordHeadDetail.toString());
			model.addObject("hubList", hubList);
			model.addObject("ordHeadDetail", ordHeadDetail);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/editOrderProcess", method = RequestMethod.POST)
	public String editOrderProcessMethod(HttpServletRequest request, HttpServletResponse response) {

		try {

			List<GetOrderDetail> ordDetailList = ordHeadDetail.getGetOrderDetailList();

			List<EditOrderDataBean> orderDataList = new ArrayList<EditOrderDataBean>();
			for (int i = 0; i < ordDetailList.size(); i++) {

				int hubOrdQty = Integer
						.parseInt(request.getParameter("hub_ord_qty" + ordDetailList.get(i).getOrderDetailId()));
				System.err.println("hubOrdQty " + hubOrdQty);

				if (ordDetailList.get(i).getMsQty() != hubOrdQty) {

					System.err.println("qty changed");
					EditOrderDataBean ordDataBean = new EditOrderDataBean();

					ordDataBean.setItemTotal((hubOrdQty * ordDetailList.get(i).getItemRate()));
					ordDataBean.setMsQty(hubOrdQty);
					ordDataBean.setOrderDetailId(ordDetailList.get(i).getOrderDetailId());
					ordDataBean.setOrderHeaderId(ordDetailList.get(i).getOrderHeaderId());

					orderDataList.add(ordDataBean);

				}

			} // end of for

			// updateOrderByMS

			ErrorMessage errMsg = rest.postForObject(Constants.url + "updateOrderByMS", orderDataList,
					ErrorMessage.class);

			System.err.println("Update-updateOrderByMS response  " + errMsg.toString());

		} catch (Exception e) {
			System.err.println("Exception in Update Orders by MS updateOrderByMS consume " + e.getMessage());

			e.printStackTrace();
		}

		return "redirect:/showHubOrders";

	}

	// Order Hisory started

	@RequestMapping(value = "/showOrderHistory", method = RequestMethod.GET)
	public ModelAndView showOrderHistoryMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/orderhistory");

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
			
			
			
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String date = sdf.format(now.getTime());
			model.addObject("ordDate", date);
			

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// getOrderHistory-> by selected hub id and  date

	@RequestMapping(value = "/getOrderHistory", method = RequestMethod.POST)
	public ModelAndView getOrderHistoryMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/orderhistory");

			int hubId = Integer.parseInt(request.getParameter("sel_hub"));
			String date = request.getParameter("date");
			Locale locale = LocaleContextHolder.getLocale();


			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("orderStatus", 3);
			map.add("orderType", "0,1");
			map.add("hubId", hubId);
			map.add("date", DateConvertor.convertToYMD(date));

			// getOrderByHubIdStausAndType
			GetOrderHub[] orderRes = rest.postForObject(Constants.url + "getOrderByHubIdStausAndType", map,
					GetOrderHub[].class);

			ordHeaderList = new ArrayList<GetOrderHub>(Arrays.asList(orderRes));

			System.err.println("ordHeaderList " + ordHeaderList.toString());
			model.addObject("hubList", hubList);
			model.addObject("ordHeaderList", ordHeaderList);

			model.addObject("langSelected", langSelected);
			model.addObject("selectedHub", hubId);
			model.addObject("ordDate", date);
		} catch (Exception e) {
			//model = new ModelAndView("order/orderhistory");
			e.printStackTrace();
		}

		return model;

	}
	//order history detail jsp to be done
	@RequestMapping(value = "/showOrderHisDetail/{ordHeaderId}", method = RequestMethod.GET)
	public ModelAndView showOrderHisDetailMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int ordHeaderId) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/ordHistDetail");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderHeaderId", ordHeaderId);

			// getOrderByOrderHeaderId
			ordHeadDetail = rest.postForObject(Constants.url + "getOrderByOrderHeaderId", map, GetOrderHub.class);
			// ordHeaderList = new ArrayList<GetOrder>(Arrays.asList(orderRes));
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

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.common.DateConvertor;
import com.ats.msadmin.model.master.ErrorMessage;
import com.ats.msadmin.model.master.GetOrderHub;
import com.ats.msadmin.model.master.Hub;
import com.ats.msadmin.model.order.GetOrder;

@Controller
@Scope("session")
public class ProdController {

	List<GetOrderHub> ordHeaderList;
	List<Hub> hubList;
	
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/startProd", method = RequestMethod.POST)
	public String startDistProcessMethod(HttpServletRequest request, HttpServletResponse response) {

		try {
 
			String[] selectedOrdHeads = request.getParameterValues("startProdOrdHeader");
			
		   	StringBuilder sb = new StringBuilder();

			for (int i = 0; i < selectedOrdHeads.length; i++) {
				
				sb = sb.append(selectedOrdHeads[i] + ",");

			}

			String ordIds = sb.toString();
			ordIds = ordIds.substring(0, ordIds.length() - 1);
			System.out.println("ordIds" + ordIds);
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			map.add("orderStatus", 2);
			
			map.add("orderHeaderList", ordIds);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "updateOrderStatus", map, ErrorMessage.class);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "redirect:/showOrderProd";
	}
	
	
	
	@RequestMapping(value = "/showOrderProd", method = RequestMethod.GET)
	public ModelAndView showAddCatMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("order/ordHeadProd");

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
	
	
	//getOrderHeaderForProd
	
	
	@RequestMapping(value = "/getOrderHeaderForProd", method = RequestMethod.POST)
	public ModelAndView getOrderHeaderForProdMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			
			model = new ModelAndView("order/ordHeadProd");

			int hubId = Integer.parseInt(request.getParameter("sel_hub"));

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderStatus", 2);
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
	
	//showProdOrderDetail
	
	GetOrder ordHeadDetail;
	
	//order history detail jsp to be done
		@RequestMapping(value = "/showProdOrderDetail/{ordHeaderId}", method = RequestMethod.GET)
		public ModelAndView showProdOrderDetaillMethod(HttpServletRequest request, HttpServletResponse response,
				@PathVariable int ordHeaderId) {

			ModelAndView model = null;
			try {
				model = new ModelAndView("order/ordDetailProd");

				Locale locale = LocaleContextHolder.getLocale();

				// System.err.println("current language is - " + locale.toString());

				int langSelected = 0;

				if (locale.toString().equalsIgnoreCase("mr")) {
					langSelected = 1;
				}

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("orderHeaderId", ordHeaderId);

				// getOrderByOrderHeaderId
				ordHeadDetail = rest.postForObject(Constants.url + "getOrderByOrderHeaderId", map, GetOrder.class);
				// ordHeaderList = new ArrayList<GetOrder>(Arrays.asList(orderRes));
				
				ordHeadDetail.setOrderDate(DateConvertor.convertToDMY(ordHeadDetail.getOrderDate()));
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

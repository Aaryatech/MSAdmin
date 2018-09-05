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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.common.DateConvertor;
import com.ats.msadmin.model.dist.DailyDistHeader;
import com.ats.msadmin.model.master.DatewiseRoute;
import com.ats.msadmin.model.master.ErrorMessage;

@Controller
@Scope("session")
public class DistributionController {

	List<DatewiseRoute> datewiseRouteList;
	RestTemplate rest = new RestTemplate();

	List<DailyDistHeader> dailyDistHeadList;

	@RequestMapping(value = "/showStartDistri", method = RequestMethod.GET)
	public ModelAndView showStartDistriMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			model = new ModelAndView("startdist/startDistrib");

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model.addObject("langSelected", langSelected);

			// getRouteAllocationDatewise

			DatewiseRoute[] dateWiseRouteAll = rest.getForObject(Constants.url + "getRouteAllocationDatewise",
					DatewiseRoute[].class);
			datewiseRouteList = new ArrayList<DatewiseRoute>(Arrays.asList(dateWiseRouteAll));

			// getDailyDistByDate
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(now.getTime());
			map.add("date", date);

			DailyDistHeader[] dailyDistRes = rest.postForObject(Constants.url + "getDailyDistByDate", map,
					DailyDistHeader[].class);
			dailyDistHeadList = new ArrayList<DailyDistHeader>(Arrays.asList(dailyDistRes));

			for (int i = 0; i < datewiseRouteList.get(0).getRouteAllocationList().size(); i++) {

				datewiseRouteList.get(0)
						.setCurrDate(DateConvertor.convertToDMY(datewiseRouteList.get(i).getCurrDate()));
				boolean isSameRoute = false;
				
				for (int j = 0; j < dailyDistHeadList.size(); j++) {

					if (datewiseRouteList.get(0).getRouteAllocationList().get(i).getRouteId() == dailyDistHeadList
							.get(j).getRouteId()) {

						isSameRoute = true;
					}

				} // end of inner for

				if (isSameRoute) {
					System.err.println("inside true : same route already ");
					
					datewiseRouteList.get(0).getRouteAllocationList().get(i).setIsSameRoute(1);

				}
			}

			model.addObject("datewiseRouteList", datewiseRouteList);
			System.err.println("datewiseRouteList " + datewiseRouteList.get(0).toString());

		} catch (Exception e) {

			e.printStackTrace();
		}

		return model;

	}

	// startDistProcess insert t_daily dist_header

	@RequestMapping(value = "/startDistProcess", method = RequestMethod.POST)
	public String startDistProcessMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			String[] selctedRoute = request.getParameterValues("distRoute");
			
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			String date = sdf.format(now.getTime());
			
			dailyDistHeadList = new ArrayList<DailyDistHeader>();
		
			for (int i = 0; i < selctedRoute.length; i++) {

				System.err.println("route  Id checked " + selctedRoute[i]);

				DailyDistHeader disHeader = new DailyDistHeader();

				disHeader.setRouteId(Integer.parseInt(selctedRoute[i]));
				disHeader.setDate(date);
				
				dailyDistHeadList.add(disHeader);
			}//end of for loop
			
			List<DailyDistHeader> inserRes=rest.postForObject(Constants.url + "saveDailyDistHeader", dailyDistHeadList,
 					List.class);
 			
		} catch (Exception e) {

			e.printStackTrace();

		}

		return "redirect:/showStartDistri";
	}

}

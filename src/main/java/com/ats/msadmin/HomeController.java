package com.ats.msadmin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.model.dashreport.AllHubLatestOrder;
import com.ats.msadmin.model.dashreport.DashboardData;
import com.ats.msadmin.model.master.Category;
import com.ats.msadmin.model.report.CategoryDistReport;
import com.ats.msadmin.model.user.LoginResponseMU;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	RestTemplate rest = new RestTemplate();
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String translate(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("Inside Login Process");
		
		ModelAndView model = null;
		
		String mobNo=request.getParameter("username");
		
		String pass=request.getParameter("password");
	//loginResponseMah
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		map.add("msContactNo", mobNo);
		map.add("msPwd", pass);
		
		LoginResponseMU logResMU=rest.postForObject(Constants.url + "/loginResponseMah", map, LoginResponseMU.class);
		if(logResMU.isError()==false) {
			
			model = new ModelAndView("home");
			
			HttpSession session =request.getSession();
			session.setAttribute("user", logResMU.getMahasnaghUser());
			return "redirect:/home";
		}
		else {
			model = new ModelAndView("login");
			model.addObject("loginErr","Invalid Login");
			
			return "redirect:/invalidLogin";

		}
		
		/*System.err.println("logResMU" +logResMU.toString());
		Locale locale = LocaleContextHolder.getLocale();

		// System.err.println("current language is - " + locale.toString());

		int langSelected = 0;

		if (locale.toString().equalsIgnoreCase("mr")) {
			langSelected = 1;
		}

		model.addObject("langSelected", langSelected);
*/
		

	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public ModelAndView displayLoginAgain(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("login");

		logger.info("/sessionTimeOut request mapping.");

		model.addObject("loginErr", "Session timeout ! Please login again . . .");

		return model;

	}
	
	
	@RequestMapping(value = "/invalidLogin", method = RequestMethod.GET)
	public ModelAndView invalidLogin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("login");
		try {

			model.addObject("loginErr","Invalid Login Details");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("home");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(now.getTime());

			map.add("curDate", date);

			map.add("orderType", 0);
			
			DashboardData dashBoard = rest.postForObject(Constants.url + "/getMSDashBoard", map,
					DashboardData.class);

			System.err.println("msDashboardData " + dashBoard.toString());
			model.addObject("dashBoard", dashBoard);
			if(dashBoard.getNoOrderHubList().size()>0)
			model.addObject("noOrderHubCount", dashBoard.getNoOrderHubList().size());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/getCatOrdQty", method = RequestMethod.GET)
	@ResponseBody public List<CategoryDistReport> getcatData(HttpServletRequest request, HttpServletResponse response) {
		
		List<CategoryDistReport> catwiseHubOrdQtyList = new ArrayList<CategoryDistReport>();

		System.err.println("In Ajax call /getCatOrdQty  MS ");
		try {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(now.getTime());

		map.add("curDate", date);

		map.add("hubId", 0); 
		
		//same web service usef for hub panel by passing specific Hub Id 

		CategoryDistReport[] catwiseHubOrdQty = rest.postForObject(Constants.url + "/getHubReportCatwise", map,
				CategoryDistReport[].class);
		catwiseHubOrdQtyList = new ArrayList<CategoryDistReport>(Arrays.asList(catwiseHubOrdQty));

		System.err.println("catwiseHubOrdQty  MS  in Ajax" + catwiseHubOrdQtyList.toString());
		}catch (Exception e) {
			
			System.err.println("catwiseHubOrdQty  MS  in Ajax" + e.getMessage());
			e.printStackTrace();
			
		}
		return catwiseHubOrdQtyList;

	}
	
	@RequestMapping(value = "/getHubLatesOrdersForGraph", method = RequestMethod.GET)
	@ResponseBody public List<AllHubLatestOrder> getHubLatesOrdersForGraph(HttpServletRequest request, HttpServletResponse response) {
		
		List<AllHubLatestOrder> hubLatesOrderList = new ArrayList<AllHubLatestOrder>();

		System.err.println("In Ajax call /getHubLatesOrdersForGraph  MS ");
		try {
		

		AllHubLatestOrder[] hubLatesOrdRes = rest.getForObject(Constants.url + "/getHubLatesOrdersForGraph",AllHubLatestOrder[].class);
		hubLatesOrderList = new ArrayList<AllHubLatestOrder>(Arrays.asList(hubLatesOrdRes));

		System.err.println("hubLatesOrderList  MS  in Ajax" + hubLatesOrderList.toString());
		}catch (Exception e) {
			
			System.err.println(" @ getHubLatesOrdersForGraph hubLatesOrderList  MS  in Ajax" + e.getMessage());
			e.printStackTrace();
			
		}
		return hubLatesOrderList;

	}
	
	
}

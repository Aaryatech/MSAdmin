package com.ats.msadmin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class WelcomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	
	

/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "/login";
	}
	
	
	@RequestMapping(value = "/getLogin", method = RequestMethod.GET)
	public ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("templates/sampleForm");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			
			System.err.println("current language is - " +locale.toString());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
*/
	
	@RequestMapping(value = "/marathi", method = RequestMethod.GET)
	public ModelAndView grid(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("templates/datepicker");
		try {

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/translate", method = RequestMethod.GET)
	public ModelAndView translate(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("home");

		String str = request.getParameter("txtMarathi");

		System.err.println(" String with unicode  " + str);
		
	
		return model;

	}
}

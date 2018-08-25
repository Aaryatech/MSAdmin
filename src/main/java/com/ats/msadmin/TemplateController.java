package com.ats.msadmin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/templates")
public class TemplateController {

	private static final Logger logger = LoggerFactory.getLogger(TemplateController.class);

	@RequestMapping(value = "/dataTable", method = RequestMethod.GET)
	public ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("templates/datatable");

		return model;

	}

	@RequestMapping(value = "/icons", method = RequestMethod.GET)
	public ModelAndView icons(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("templates/icons");

		return model;

	}

	@RequestMapping(value = "/getGrid", method = RequestMethod.GET)
	public ModelAndView getGrid(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("templates/grid");

		return model;

	}

}

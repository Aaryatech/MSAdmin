package com.ats.msadmin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.ats.msadmin.common.Constants;
import com.ats.msadmin.model.master.ErrorMessage;

@Controller
@Scope("session")
public class ProdController {

	
	@RequestMapping(value = "/startProd", method = RequestMethod.POST)
	public String startDistProcessMethod(HttpServletRequest request, HttpServletResponse response) {

		try {
			RestTemplate rest = new RestTemplate();
 
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

		return "redirect:/showHubOrders";
	}
	
	
}

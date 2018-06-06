package com.bcits.bfm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcits.bfm.model.BroadTeleTariffMaster;
import com.bcits.bfm.model.ELTariffMaster;

import com.bcits.bfm.service.broadTeleTariffManagment.BroadTeleTariffMasterService;

import com.bcits.bfm.util.DateTimeCalender;
import com.bcits.bfm.util.SessionData;
import com.bcits.bfm.view.BreadCrumbTreeService;

@Controller
public class BroadTeleTariffManagmentController {
	@Autowired
	private BreadCrumbTreeService breadCrumbService;

	@Autowired
	BroadTeleTariffMasterService broadTeleTariffMasterService;

	DateTimeCalender dateTimeCalender = new DateTimeCalender();
	
	static Logger logger = LoggerFactory.getLogger(BroadTeleTariffManagmentController.class);

	@RequestMapping(value = "/broadTeleTariffMaster", method = RequestMethod.GET)
	public String indexTariffMaster(ModelMap model, HttpServletRequest request)throws InstantiationException, IllegalAccessException, ClassNotFoundException 
	{
		logger.info("::::::::::::::: Broad Band Tele Controller ::::::::::::::::::");
		model.addAttribute("ViewName", " Tariff");
		breadCrumbService.addNode("nodeID", 0, request);
		breadCrumbService.addNode("Tariff", 1, request);
		breadCrumbService.addNode("Manage Broadband Telecome Tariff Master", 2, request);
		model.addAttribute("username",
				SessionData.getUserDetails().get("userID"));

		List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		Map<String, String> map = null;
		String[] statusArray = { "Current" };
		for (int i = 0; i < statusArray.length; i++) {
			map = new HashMap<String, String>();
			map.put("value", statusArray[i]);
			map.put("name", statusArray[i]);
			result.add(map);
		}
		model.addAttribute("status", result);
		List<Map<String, String>> output = new ArrayList<Map<String, String>>();

		Map<String, String> map1 = null;
		String[] nodeArray = { "Tariff Rate Node", "Hierarchical Node" };
		for (int i = 0; i < nodeArray.length; i++) {
			map1 = new HashMap<String, String>();
			map1.put("value", nodeArray[i]);
			map1.put("name", nodeArray[i]);
			output.add(map1);
		}
		model.addAttribute("tariffNodetype", output);

		return "broadTeleTariff/broadTeleTariffmaster";
	}

	@RequestMapping(value = "/btTariff/read", method = RequestMethod.POST)
	public @ResponseBody
	List<BroadTeleTariffMaster> readTariff(@RequestBody Map<String, Object> model,
			HttpServletRequest req) {
		logger.info("el tariff id" + (Integer) model.get("broadTeleTariffId"));
		return broadTeleTariffMasterService
				.findAllOnParentId((Integer) model.get("broadTeleTariffId"),
						(String) model.get("status"));
	}

	@RequestMapping(value = "/btTariff/create", method = RequestMethod.POST)
	public String addNode(@RequestParam("broadTeleTariffCode") String tariffcode,
			@RequestParam("broadTeleTariffId") int eltariffId,
			@RequestParam("broadTeleTreeHierarchy") String treeHierarchy,
			@RequestParam("broadTeleTariffNodetype") String tariffnodetype,
			@RequestParam("status") String status,
			@RequestParam("broadTeleTariffDescription") String tariffdescription,
			@RequestParam("broadTeleTariffName") String tariffname,

			HttpServletRequest request, HttpServletResponse response)
			throws ParseException {

		logger.info("valid to" + request.getParameter("validTo"));
		logger.info("validFrom" + request.getParameter("validFrom"));

		HttpSession session = request.getSession(true);
		session.getAttribute("userId");

		BroadTeleTariffMaster tariff = new BroadTeleTariffMaster();
		tariff.setLastUpdatedDT((Timestamp) session
				.getAttribute("lastUpdatedDT"));
		tariff.setValidTo(dateTimeCalender.getdateFormat(request
				.getParameter("validTo")));
		tariff.setValidFrom(dateTimeCalender.getdateFormat(request
				.getParameter("validFrom")));
		tariff.setCreatedBy((String) session.
				getAttribute(("userId")));
		tariff.setLastUpdatedBy((String)session.
				getAttribute(("userId")));
		tariff.setBroadTeleTariffNodetype(tariffnodetype);
		tariff.setBroadTeleTariffName(tariffname);
		tariff.setBroadTeleTariffCode(tariffcode);
		tariff.setBroadTeleParentId(eltariffId);
		tariff.setBroadTeleTreeHierarchy(treeHierarchy + " > " + tariffname);
		tariff.setStatus("Active");
		tariff.setBroadTeleTariffDescription(tariffdescription);

		broadTeleTariffMasterService.save(tariff);

		PrintWriter out;

		List<BroadTeleTariffMaster> getId = broadTeleTariffMasterService.getTariffDetail(
				eltariffId, tariffname);
		logger.info(""+getId.size());

		int value = getId.get(0).getBroadTeleTariffId();

		try {
			out = response.getWriter();
			out.write(value + "");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	@RequestMapping(value = "/btTariffMaster/getDetails/{nodeid}", method = RequestMethod.GET)
	public @ResponseBody
	BroadTeleTariffMaster getDetailsOnNodeId(@PathVariable Integer nodeid,
			HttpServletRequest request, HttpServletResponse response) {
		BroadTeleTariffMaster tariff = new BroadTeleTariffMaster();
		tariff.setBroadTeleTariffId(nodeid);
		return broadTeleTariffMasterService.getNodeDetails(nodeid);
	}
	
	
	
	@RequestMapping(value = "/btTariff/update", method = RequestMethod.POST)
	public String updateTariffMaster(
			@RequestParam("broadTeleTariffCode") String tariffcode,
			@RequestParam("broadTeleTariffId") int eltariffId,
			@RequestParam("broadTeleTreeHierarchy") String treeHierarchy,
			@RequestParam("broadTeleTariffNodetype") String tariffnodetype,
			@RequestParam("status") String status,
			@RequestParam("broadTeleTariffDescription") String tariffdescription,
			@RequestParam("broadTeleTariffName") String tariffname,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException {

		HttpSession session = request.getSession(true);
		session.getAttribute("userId");

		logger.info("valid to update" + request.getParameter("validTo"));
		logger.info("validFrom update"
				+ request.getParameter("validFrom"));

		BroadTeleTariffMaster tariffmaster = new BroadTeleTariffMaster();
		tariffmaster.setBroadTeleTariffId(eltariffId);
		List<BroadTeleTariffMaster> list = broadTeleTariffMasterService
				.getTariffNameBasedonTariffid(eltariffId);;
		Integer parentId = list.get(0).getBroadTeleParentId();
		tariffmaster.setCreatedBy((String) session.getAttribute(("userId")));
		tariffmaster.setLastUpdatedBy((String)session.getAttribute(("userId")));
		tariffmaster.setLastUpdatedDT((Timestamp) session
				.getAttribute("lastUpdatedDT"));
		tariffmaster.setBroadTeleTariffName(tariffname);
		tariffmaster.setBroadTeleTariffCode(tariffcode);
		tariffmaster.setBroadTeleTariffNodetype(tariffnodetype);
		tariffmaster.setBroadTeleParentId(parentId);
	
		tariffmaster.setBroadTeleTreeHierarchy(treeHierarchy);
		tariffmaster.setBroadTeleTariffDescription(tariffdescription);
		tariffmaster.setStatus(status);
		tariffmaster.setValidTo(dateTimeCalender.getdateFormat(request
				.getParameter("validTo")));
		tariffmaster.setValidFrom(dateTimeCalender.getdateFormat(request
				.getParameter("validFrom")));

		broadTeleTariffMasterService.update(tariffmaster);

		PrintWriter out;
		List<BroadTeleTariffMaster> getId = broadTeleTariffMasterService.getTariffDetail(
				parentId, tariffname);
		logger.info(""+getId.size());

		int value = getId.get(0).getBroadTeleTariffId();
		try {
			out = response.getWriter();
			out.write(value + "Updated successfully");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(value = "/bttariff/delete", method = RequestMethod.POST)
	public @ResponseBody
	ELTariffMaster deleteAssets(@RequestParam("wtTariffId") int wtTariffId,
			HttpServletRequest request, HttpServletResponse response) {
		
		PrintWriter out;
		List<BroadTeleTariffMaster> list=broadTeleTariffMasterService.findAllOnParentIdwoStatus(wtTariffId);
		if(list.size()==0){
			broadTeleTariffMasterService.delete(wtTariffId);
		
		
		try {
			out = response.getWriter();
			out.write("Deleted Successfully!!!");
		} catch (IOException e) {
			e.printStackTrace();
		}
	} else {
		try {
			out = response.getWriter();
			out.write("Only Leaf node can be deleted!!!");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
		
		return null;
	}
	
}

package com.postoffice.web.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.PackageDTO;
import com.postoffice.web.service.GcsService;
import com.postoffice.web.service.PackageService;

@Controller
public class PackageController {


   @Autowired
   private PackageService packageService;
   
   @RequestMapping("/packagingList")
   public String packagingList(Model model,
            @RequestParam(defaultValue="0") String sort) {
      
      model.addAttribute("mailList",packageService.mailList(sort));
      model.addAttribute("packageList",packageService.packageList());
      
      List<PackageDTO> list = packageService.packageList();
      System.out.println(list.size());
      for(int i = 0; i < list.size(); i++) {
         PackageDTO dto = list.get(i);
         System.out.println("------------------------------------------");
         System.out.println(dto.getPackage_id());
         System.out.println(dto.getPackage_weight());
         System.out.println("------------------------------------------");
      }
      return "manager/packaging";
   }
   
   @RequestMapping("/packaging")
   public String packaging(Model model,
         @RequestParam(value="mailIdList[]") List<String> mailIdList,
         @RequestParam(value="totalWeight") String totalWeight) throws IOException {
         
         model.addAttribute("packagingList", packageService.mailPackaging(totalWeight, mailIdList));
         
         return "redirect:/packagingList";
   }
   
   @RequestMapping("/pack_mailList")
   public String pack_mailList(Model model, PackageDTO dto) {
         
         model.addAttribute("pack_num",dto.getPackage_id());
         model.addAttribute("pack_mailList",packageService.pack_mailList(dto));
         return "manager/packageMailList_popup";
   }
   @RequestMapping("/clientInfo")
   public String clientInfo(String to_name,String from_name,String to_address,String from_address,String vid,int mail_weight) {
         packageService.clientInfo(to_name,from_name,to_address,from_address,vid,mail_weight);
         return "redirect:/mailCheck";
   }
   
   @RequestMapping("/mailCheck")
   public String clientInfoList(Model model) {
	  List<MailDTO> checkList=packageService.mailCheck();
	  
	  model.addAttribute("checkList",checkList);
	   return "manager/packaging";
   }
   
}

	@Autowired
	private PackageService packageService;
	@Autowired
	private GcsService gcsService;
	
	@RequestMapping("/packagingList")
	public String packagingList(Model model,
				@RequestParam(defaultValue="0") String sort) {
		
		model.addAttribute("mailList",packageService.mailList(sort));
		model.addAttribute("packageList",packageService.packageList());
		
		List<PackageDTO> list = packageService.packageList();
		System.out.println(list.size());
		for(int i = 0; i < list.size(); i++) {
			PackageDTO dto = list.get(i);
			System.out.println("------------------------------------------");
			System.out.println(dto.getPackage_id());
			System.out.println(dto.getPackage_weight());
			System.out.println("------------------------------------------");
		}
		return "manager/packaging";
	}
	
	@RequestMapping("/packaging")
	public String packaging(Model model,
			@RequestParam(value="mailIdList[]") List<String> mailIdList,
			@RequestParam(value="totalWeight") String totalWeight) throws IOException {
			
			gcsService.sendMessageToGcs("requestDelivery");
			model.addAttribute("packagingList", packageService.mailPackaging(totalWeight, mailIdList));
			
			return "redirect:/packagingList";
	}
	
	@RequestMapping("/pack_mailList")
	public String pack_mailList(Model model, PackageDTO dto) {
			
			model.addAttribute("pack_num",dto.getPackage_id());
			model.addAttribute("pack_mailList",packageService.pack_mailList(dto));
			return "manager/packageMailList_popup";
	}
	
}
}

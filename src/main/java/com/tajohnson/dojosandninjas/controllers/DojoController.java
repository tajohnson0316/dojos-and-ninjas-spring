package com.tajohnson.dojosandninjas.controllers;

import com.tajohnson.dojosandninjas.models.Dojo;
import com.tajohnson.dojosandninjas.models.Ninja;
import com.tajohnson.dojosandninjas.services.DojoService;
import com.tajohnson.dojosandninjas.services.NinjaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class DojoController {
  @Autowired
  private DojoService dojoService;

  @Autowired
  private NinjaService ninjaService;

  @DeleteMapping("/dojos/delete/{id}")
  public String deleteDojo(@PathVariable("id") Long id) {
    dojoService.deleteDojo(id);

    return "redirect:/";
  }

  @GetMapping("/")
  public String index(@ModelAttribute("dojo") Dojo dojo, Model model) {
    model.addAttribute("allDojos", this.dojoService.allDojos());

    return "dojo/index.jsp";
  }

  @PostMapping("/dojos/create/new")
  public String createNewDojo(
    @Valid @ModelAttribute("dojo") Dojo dojo,
    BindingResult result,
    Model model
  ) {
    if (result.hasErrors()) {
      model.addAttribute("allDojos", this.dojoService.allDojos());
      return "dojo/index.jsp";
    }
    dojoService.createDojo(dojo);
    return String.format("redirect:/dojos/%d", dojo.getId());
  }

  @GetMapping("/dojos/{id}")
  public String viewDojo(
    @PathVariable("id") Long id,
    @ModelAttribute("ninja") Ninja ninja,
    Model model
  ) {
    model.addAttribute("dojo", this.dojoService.getOneDojoById(id));

    return "dojo/viewDojo.jsp";
  }

  @PostMapping("/dojos/{dojoId}/ninjas/new/create")
  public String addNinjaToDojo(
    @PathVariable("dojoId") Long id,
    @Valid @ModelAttribute("ninja") Ninja ninja,
    BindingResult result,
    Model model
  ) {
    if (result.hasErrors()) {
      model.addAttribute("dojo", this.dojoService.getOneDojoById(id));
      model.addAttribute("ninja", ninja);

      return "dojo/viewDojo.jsp";
    }
    Ninja newNinja = ninjaService.createNinja(ninja);
    dojoService.addNinjaToDojo(id, newNinja);

    return String.format("redirect:/dojos/%d", id);
  }
}
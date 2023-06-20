package com.tajohnson.dojosandninjas.controllers;

import com.tajohnson.dojosandninjas.models.Ninja;
import com.tajohnson.dojosandninjas.services.DojoService;
import com.tajohnson.dojosandninjas.services.NinjaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NinjaController {
  @Autowired
  private NinjaService ninjaService;

  @Autowired
  private DojoService dojoService;

  @GetMapping("/ninjas/{id}")
  public String viewNinja(@PathVariable("id") Long id, Model model) {
    model.addAttribute("ninja", ninjaService.getOneNinjaById(id));

    return "ninja/viewNinja.jsp";
  }

  @GetMapping("/ninjas/new/form")
  public String displayNewNinjaForm(@ModelAttribute("ninja") Ninja ninja, Model model) {
    model.addAttribute("allDojos", dojoService.allDojos());

    return "ninja/ninjaForm.jsp";
  }

  @PostMapping("/ninjas/new/create")
  public String createNinja(
    @Valid @ModelAttribute("ninja") Ninja ninja,
    BindingResult result,
    Model model
  ) {
    if (result.hasErrors()) {
      model.addAttribute("allDojos", dojoService.allDojos());
      model.addAttribute("ninja", ninja);

      return "ninja/ninjaForm.jsp";
    }
    ninjaService.createNinja(ninja);

    return String.format("redirect:/ninjas/%d", ninja.getId());
  }
}
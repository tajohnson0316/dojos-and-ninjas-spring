package com.tajohnson.dojosandninjas.services;

import com.tajohnson.dojosandninjas.models.Dojo;
import com.tajohnson.dojosandninjas.models.Ninja;
import com.tajohnson.dojosandninjas.repositories.DojoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DojoService {
  @Autowired
  private DojoRepository dojoRepository;

  public List<Dojo> allDojos() {
    return this.dojoRepository.findAll();
  }

  public Dojo getOneDojoById(Long id) {
    Optional<Dojo> optional = this.dojoRepository.findById(id);

    return optional.orElse(null);
  }

  public Dojo createDojo(Dojo dojo) {
    return this.dojoRepository.save(dojo);
  }

  public Dojo addNinjaToDojo(Long dojoId, Ninja ninja) {
    Dojo currentDojo = getOneDojoById(dojoId);
    currentDojo.getNinjas().add(ninja);

    return currentDojo;
  }

  public void deleteDojo(Long id) {
    this.dojoRepository.delete(getOneDojoById(id));
  }
}
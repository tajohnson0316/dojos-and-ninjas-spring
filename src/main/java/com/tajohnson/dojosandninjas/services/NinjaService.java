package com.tajohnson.dojosandninjas.services;

import com.tajohnson.dojosandninjas.models.Ninja;
import com.tajohnson.dojosandninjas.repositories.NinjaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NinjaService {
  @Autowired
  private NinjaRepository ninjaRepository;

  public List<Ninja> allNinjas() {
    return this.ninjaRepository.findAll();
  }

  public Ninja getOneNinjaById(Long id) {
    Optional<Ninja> optional = this.ninjaRepository.findById(id);

    return optional.orElse(null);
  }

  public Ninja createNinja(Ninja ninja) {
    return this.ninjaRepository.save(ninja);
  }
}
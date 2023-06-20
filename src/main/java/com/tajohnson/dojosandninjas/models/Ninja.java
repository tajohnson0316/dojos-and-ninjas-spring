package com.tajohnson.dojosandninjas.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "ninjas")
public class Ninja {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank(message = "Cannot be blank")
  @Size(min = 2, message = "Please provide a first name for the ninja (min. 2 characters)")
  private String firstName;

  @NotBlank(message = "Cannot be blank")
  @Size(min = 2, message = "Please provide a last name for the ninja (min. 2 characters)")
  private String lastName;

  @NotNull(message = "Cannot be blank")
  @Min(value = 18, message = "All ninjas must be 18 years of age or older to enroll")
  private Integer age;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "dojo_id")
  private Dojo dojo;

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  public Ninja() {
  }

  @PrePersist
  protected void onCreate() {
    this.createdAt = new Date();
  }

  @PreUpdate
  protected void onUpdate() {
    this.updatedAt = new Date();
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public @NotNull Integer getAge() {
    return age;
  }

  public void setAge(@NotNull Integer age) {
    this.age = age;
  }

  public Dojo getDojo() {
    return dojo;
  }

  public void setDojo(Dojo dojo) {
    this.dojo = dojo;
  }

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }
}
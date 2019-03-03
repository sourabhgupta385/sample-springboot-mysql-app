package com.example.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.Places;
import com.example.service.PlaceService;

@RestController
public class Welcome 
{
	@Autowired
	PlaceService service;
	
	@RequestMapping("/")
	public String hello() {
		System.out.println("hello");
		return "hello";
	}
	
	@RequestMapping("/addPlace")
	public void addPlace()
	{
		service.addPlaces();
	}
	
	@RequestMapping("/showPlace")
	public List<Places> showPlace()
	{
		return service.showPlaces();
	}
}

package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Places;
import com.example.repo.PlaceRepo;

@Service
public class PlacesServiesImpl implements PlaceService {
	
	@Autowired
	PlaceRepo repo;
	
	@Override
	public void addPlaces() {
		Places place = new Places();
		place.setCity("Jodhpur");
		place.setName("ab");
		place.setState("Rajasthan");
		repo.save(place);
		
	}

	@Override
	public List<Places> showPlaces() {
		List<Places> list = new ArrayList<>();
		list = repo.findAll();
		return list;
	}

}

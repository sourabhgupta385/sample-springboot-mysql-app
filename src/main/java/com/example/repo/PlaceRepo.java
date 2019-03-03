package com.example.repo;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.Places;

public interface PlaceRepo extends JpaRepository<Places,String>
{

}

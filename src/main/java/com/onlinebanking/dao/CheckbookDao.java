package com.onlinebanking.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.onlinebanking.model.Checkbook;

@Repository
public interface CheckbookDao extends JpaRepository<Checkbook, Integer> {

	Checkbook findByCustomerId(int customerId);
	
}

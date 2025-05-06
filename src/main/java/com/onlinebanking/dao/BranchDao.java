package com.onlinebanking.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.onlinebanking.model.Branch;

@Repository
public interface BranchDao extends JpaRepository<Branch, Integer> {

}

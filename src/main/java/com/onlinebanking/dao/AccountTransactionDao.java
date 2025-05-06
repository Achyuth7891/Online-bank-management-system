package com.onlinebanking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.onlinebanking.model.AccountTransaction;

@Repository
public interface AccountTransactionDao extends JpaRepository<AccountTransaction, Integer> {
	
	List<AccountTransaction> findByAccountId(int accountId);

	@Query(value = "select a from AccountTransaction a where a.accountId =:accountId and a.date=:date")
	List<AccountTransaction> findByAccountIdAndDate(@Param("accountId") int accountId, @Param("date") String date);
	
}

package com.gdj37.workcar.web.mypagePerson.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.mypagePerson.dao.ImypPersonADao;


@Service
public class mypPersonAService implements ImypPersonAService{
	@Autowired
	public ImypPersonADao imypPersonADao;
}

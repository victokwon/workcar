package com.gdj37.workcar.web.imem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.imem.dao.IimemAttndDAO;

@Service
public class imemAttndService implements IimemAttndService {
	@Autowired IimemAttndDAO iimemAttndDAO; 
}

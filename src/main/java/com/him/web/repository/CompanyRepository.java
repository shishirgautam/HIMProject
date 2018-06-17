/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.him.web.repository;

import com.him.web.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author sony
 */
public interface CompanyRepository extends JpaRepository<Company, Long>{
    
    
}

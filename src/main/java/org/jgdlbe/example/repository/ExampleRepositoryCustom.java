package org.jgdlbe.example.repository;

import org.jgdlbe.example.dto.ExampleFilterDTO;
import org.jgdlbe.example.entity.ExampleEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ExampleRepositoryCustom {

  Page<ExampleEntity> findByFilter(ExampleFilterDTO filterDTO, Pageable pageable);


}

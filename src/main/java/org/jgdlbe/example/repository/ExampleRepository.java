package org.jgdlbe.example.repository;

import java.util.Optional;
import java.util.UUID;
import org.jgdlbe.example.entity.ExampleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExampleRepository extends JpaRepository<ExampleEntity, UUID>,
    ExampleRepositoryCustom {

  Optional<ExampleEntity> findByExampleCode(String exampleCode);
}

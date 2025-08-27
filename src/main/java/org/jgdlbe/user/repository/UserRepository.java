package org.jgdlbe.user.repository;

import java.util.Optional;
import java.util.UUID;
import org.jgdlbe.example.entity.ExampleEntity;
import org.jgdlbe.user.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<UserEntity, UUID> {

    @Query(value = "select a from UserEntity a where a.username = :username")
    Optional<UserEntity> findByUsername(@Param("username") String username);
}

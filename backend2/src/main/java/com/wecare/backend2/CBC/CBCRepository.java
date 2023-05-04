package com.wecare.backend2.CBC;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CBCRepository extends JpaRepository<CBC, Integer> {
}

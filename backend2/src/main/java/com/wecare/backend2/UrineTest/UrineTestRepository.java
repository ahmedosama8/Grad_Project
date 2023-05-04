package com.wecare.backend2.UrineTest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UrineTestRepository extends JpaRepository<UrineTest, Integer> {
}

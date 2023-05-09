package com.wecare.backend2.Patient;

import com.wecare.backend2.Doctor.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Integer> {
    Optional<Patient> findByUsername(String username);
}

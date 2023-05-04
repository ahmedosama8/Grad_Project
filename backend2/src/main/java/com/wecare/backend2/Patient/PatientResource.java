package com.wecare.backend2.Patient;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.hateoas.EntityModel;

import java.net.URI;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/patient")
public class PatientResource {

    private PatientRepository patientRepo;

    public PatientResource(PatientRepository patientRepo) {
        this.patientRepo = patientRepo;
    }

    @GetMapping("/list")
    public List<Patient> list(){
        return patientRepo.findAll();
    }

    @GetMapping("/{id}")
    public EntityModel<Patient> show(@PathVariable int id) throws Exception {
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("id");
        }
        EntityModel<Patient> entityModel = EntityModel.of(patient.get());
        WebMvcLinkBuilder link = linkTo(methodOn(this.getClass()).list());
        entityModel.add(link.withRel("all-patients"));

        return entityModel;
    }

    @PostMapping("/new")
    public ResponseEntity<Patient> create(@RequestBody Patient patient){
        Patient newPatient = patientRepo.save(patient);
        String id = String.valueOf(newPatient.getPatient_id());
        URI loc = URI.create("/"+id);
        return ResponseEntity.created(loc).build();
    }


    @PostMapping("/login")
    public ResponseEntity login(String username, String password){
         Optional<Patient> patient = patientRepo.findByUsername(username);
         if(patient.isPresent()){
             if (Objects.equals(patient.get().getPassword(), password)){
                 return (ResponseEntity) ResponseEntity.ok();
             }
    }
        return (ResponseEntity) ResponseEntity.notFound();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Patient> update(@PathVariable Integer id, @RequestBody Patient updatedPatient){
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            return ResponseEntity.notFound().build();
        }

        Patient oldPatient = patient.get();

        oldPatient.setFirstName(updatedPatient.getFirstName());
        oldPatient.setMiddleName(updatedPatient.getMiddleName());
        oldPatient.setLastName(updatedPatient.getLastName());
        oldPatient.setAge(updatedPatient.getAge());
        oldPatient.setAllergies(updatedPatient.getAllergies());
        oldPatient.setBloodType(updatedPatient.getBloodType());
        oldPatient.setMedicalConditions(updatedPatient.getMedicalConditions());
        oldPatient.setDiagnoses(updatedPatient.getDiagnoses());
        oldPatient.setCity(updatedPatient.getCity());
        oldPatient.setPhone1(updatedPatient.getPhone1());
        oldPatient.setPhone2(updatedPatient.getPhone2());
        oldPatient.setMail(updatedPatient.getMail());
        oldPatient.setGender(updatedPatient.getGender());
        oldPatient.setBirthDate(updatedPatient.getBirthDate());
        oldPatient.setNationalIdNumber(updatedPatient.getNationalIdNumber());
        oldPatient.setStreet(updatedPatient.getStreet());
        oldPatient.setMaritalStatus(updatedPatient.isMaritalStatus());


        Patient savedPatient = patientRepo.save(oldPatient);
        return ResponseEntity.ok(savedPatient);

    }


}

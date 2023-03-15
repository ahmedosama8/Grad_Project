package com.gp.gp.Patient;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.hateoas.EntityModel;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/patient")
public class PatientResource {

    private PatientRepository patientRepo;

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

}

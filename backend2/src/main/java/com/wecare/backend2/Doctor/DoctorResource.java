package com.wecare.backend2.Doctor;

import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/doctor")
public class DoctorResource {

    private DoctorRepository doctorRepo;

    public DoctorResource(DoctorRepository doctorRepo) {
        this.doctorRepo = doctorRepo;
    }

    @GetMapping("/list")
    public List<Doctor> list(){
        return doctorRepo.findAll();
    }

    @GetMapping("/{id}")
    public EntityModel<Doctor> show(@PathVariable int id) throws Exception {
        Optional<Doctor> doctor = doctorRepo.findById(id);
        if(doctor.isEmpty()){
            throw new Exception("id");
        }
        EntityModel<Doctor> entityModel = EntityModel.of(doctor.get());
        WebMvcLinkBuilder link = linkTo(methodOn(this.getClass()).list());
        entityModel.add(link.withRel("all-doctors"));

        return entityModel;
    }

    @PostMapping("/new")
    public ResponseEntity<Doctor> create(@RequestBody Doctor doctor){
        Doctor newDoctor = doctorRepo.save(doctor);
        String id = String.valueOf(newDoctor.getDoctor_id());
        URI loc = URI.create("/"+id);
        return ResponseEntity.created(loc).build();
    }

}

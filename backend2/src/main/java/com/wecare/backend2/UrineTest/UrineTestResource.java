package com.wecare.backend2.UrineTest;


import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.Patient.PatientRepository;
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
@RequestMapping("/UrineTest")
public class UrineTestResource {

    private PatientRepository patientRepo;
    private UrineTestRepository urineTestRepository;

    public UrineTestResource(PatientRepository patientRepo, UrineTestRepository urineTestRepository) {
        this.patientRepo = patientRepo;
        this.urineTestRepository = urineTestRepository;
    }

    @GetMapping("/list")
    public List<UrineTest> list(){return urineTestRepository.findAll();}


    @GetMapping("/test/{id}")
    public EntityModel<UrineTest> show(@PathVariable int id) throws Exception{
        Optional<UrineTest> urineTest = urineTestRepository.findById(id);
        if(urineTest.isEmpty()){
            throw new Exception("not found");
        }
        EntityModel<UrineTest> urineTestEntityModel = EntityModel.of(urineTest.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(methodOn(this.getClass()));
        urineTestEntityModel.add(link.withRel("list"));
        return urineTestEntityModel;
    }

    @PostMapping("/{id}/new")
    public ResponseEntity<UrineTest> create(@RequestBody UrineTest urineTest, @PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        urineTest.setPatient(patient.get());
        UrineTest newUrineTest = (UrineTest) urineTestRepository.save(urineTest);
        String urineTestid = String.valueOf(newUrineTest.getUrineTest_id());
        URI loc = URI.create("/"+id+"/"+urineTestid);
        return ResponseEntity.created(loc).build();
    }


    @GetMapping("/patient/{id}")
    public List<UrineTest> getUrineTestForPatient(@PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getUrineTests();
    }

}

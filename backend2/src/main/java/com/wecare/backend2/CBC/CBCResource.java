package com.wecare.backend2.CBC;

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
@RequestMapping("/CBC")
public class CBCResource {

    private PatientRepository patientRepo;
    private CBCRepository cbcRepository;

    public CBCResource(PatientRepository patientRepo, CBCRepository cbcRepository) {
        this.patientRepo = patientRepo;
        this.cbcRepository = cbcRepository;
    }

    @GetMapping("/list")
    public List<CBC> list(){return cbcRepository.findAll();}


    @GetMapping("/{id}")
    public EntityModel<CBC> show(@PathVariable int id) throws Exception{
        Optional<CBC> cbc = cbcRepository.findById(id);
        if(cbc.isEmpty()){
            throw new Exception("now found");
        }
        EntityModel<CBC> cbcEntityModel = EntityModel.of(cbc.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(methodOn(this.getClass()));
        cbcEntityModel.add(link.withRel("list"));
        return cbcEntityModel;
    }

    @PostMapping("/{pid}/new")
    public ResponseEntity<CBC> create(@RequestBody CBC cbc, @PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        cbc.setPatient(patient.get());
        CBC newCBC = cbcRepository.save(cbc);
        String cbcid = String.valueOf(newCBC.getCbc_id());
        URI loc = URI.create("/"+id+"/"+cbcid);
        return ResponseEntity.created(loc).build();
    }


    @GetMapping("/{pid}")
    public List<CBC> getCBCForPatient(@PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getCBCTests();
    }



}

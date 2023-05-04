package com.wecare.backend2.LipidProfile;


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
@RequestMapping("/LipidProfile")
public class LipidProfileResource {
    private PatientRepository patientRepo;
    private LipidProfileRepository lipidProfileRepository;

    public LipidProfileResource(PatientRepository patientRepo, LipidProfileRepository lipidProfileRepository) {
        this.patientRepo = patientRepo;
        this.lipidProfileRepository = lipidProfileRepository;
    }

    @GetMapping("/list")
    public List<LipidProfile> list(){return lipidProfileRepository.findAll();}


    @GetMapping("/{id}")
    public EntityModel<LipidProfile> show(@PathVariable int id) throws Exception{
        Optional<LipidProfile> lipidProfile = lipidProfileRepository.findById(id);
        if(lipidProfile.isEmpty()){
            throw new Exception("not found");
        }
        EntityModel<LipidProfile> lipidProfileEntityModel = EntityModel.of(lipidProfile.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(methodOn(this.getClass()));
        lipidProfileEntityModel.add(link.withRel("list"));
        return lipidProfileEntityModel;
    }

    @PostMapping("/{pid}/new")
    public ResponseEntity<LipidProfile> create(@RequestBody LipidProfile lipidProfile, @PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        lipidProfile.setPatient(patient.get());
        LipidProfile newLipidProfile = (LipidProfile) lipidProfileRepository.save(lipidProfile);
        String lipidprofileid = String.valueOf(newLipidProfile.getLipidProfile_id());
        URI loc = URI.create("/"+id+"/"+lipidprofileid);
        return ResponseEntity.created(loc).build();
    }


    @GetMapping("/{pid}")
    public List<LipidProfile> getLipidProfileForPatient(@PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getLipidProfileTests();
    }




}

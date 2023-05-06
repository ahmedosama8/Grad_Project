package com.wecare.backend2.LiverFunc;


import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.Patient.PatientRepository;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.hateoas.EntityModel;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/LiverFunc")
public class LiverFuncResource {

    private PatientRepository patientRepo;
    private LiverFuncRepository liverFuncRepository;


    public LiverFuncResource(PatientRepository patientRepo, LiverFuncRepository liverFuncRepository) {
        this.patientRepo = patientRepo;
        this.liverFuncRepository = liverFuncRepository;
    }

    @GetMapping("/list")
    public List<LiverFunc> list(){return liverFuncRepository.findAll();}


    @GetMapping("/test/{id}")
    public EntityModel<LiverFunc> show(@PathVariable int id) throws Exception{
        Optional<LiverFunc> liverFunc = liverFuncRepository.findById(id);
        if(liverFunc.isEmpty()){
            throw new Exception("not found");
        }
        EntityModel<LiverFunc> liverFuncEntityModel = EntityModel.of(liverFunc.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(methodOn(this.getClass()));
        liverFuncEntityModel.add(link.withRel("list"));
        return liverFuncEntityModel;
    }

    @PostMapping("/{id}/new")
    public ResponseEntity<LiverFunc> create(@RequestBody LiverFunc liverFunc, @PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        liverFunc.setPatient(patient.get());
        LiverFunc newLiverFunc = (LiverFunc) liverFuncRepository.save(liverFunc);
        String liverFuncid = String.valueOf(newLiverFunc.getLiverFunc_id());
        URI loc = URI.create("/"+id+"/"+liverFuncid);
        return ResponseEntity.created(loc).build();
    }


    @GetMapping("/patient/{id}")
    public List<LiverFunc> getLiverFuncForPatient(@PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getLiverFuncTests();
    }


}

package com.wecare.backend2.Diagnosis;

import com.wecare.backend2.Doctor.DoctorRepository;
import com.wecare.backend2.Patient.PatientRepository;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/diagnosis")
public class DiagnosisResource {
    private DoctorRepository doctorRepository;
    private PatientRepository patientRepository;
    private DiagnosisRepository diagnosisRepository;

    public DiagnosisResource(DoctorRepository doctorRepository, PatientRepository patientRepository, DiagnosisRepository diagnosisRepository) {
        this.doctorRepository = doctorRepository;
        this.patientRepository = patientRepository;
        this.diagnosisRepository = diagnosisRepository;
    }

    @GetMapping("/list")
    public List<Diagnosis> list(){
        return diagnosisRepository.findAll();
    }

    @GetMapping("/{id}")
    public EntityModel<Diagnosis> findById(@PathVariable int id) throws Exception{
        Optional<Diagnosis> diagnosis = diagnosisRepository.findById(id);
        if(diagnosis.isEmpty()){
            throw new Exception("id");
        }
        EntityModel<Diagnosis> entityModel = EntityModel.of(diagnosis.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(WebMvcLinkBuilder.methodOn(this.getClass()).list());
        entityModel.add(link.withRel("all-diagnoses"));
        return entityModel;
    }

    @PostMapping("/new")
    public ResponseEntity<Diagnosis> create(@RequestBody Diagnosis diagnosis){
        Diagnosis newDiagnosis = diagnosisRepository.save(diagnosis);
        String id = String.valueOf(newDiagnosis.getDiagnosisId());
        URI loc = URI.create("/"+id);
        return ResponseEntity.created(loc).build();
    }
}

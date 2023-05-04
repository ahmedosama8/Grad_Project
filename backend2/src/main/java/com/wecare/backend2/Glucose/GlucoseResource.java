package com.wecare.backend2.Glucose;

import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.Patient.PatientRepository;
import org.springframework.hateoas.EntityModel;
import org.springframework.web.bind.annotation.*;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/Glucose")
public class GlucoseResource {

    private PatientRepository patientRepo;
    private GlucoseRepository glucoseRepo;

    public GlucoseResource(PatientRepository patientRepo,GlucoseRepository glucoseRepo)
    {
        this.patientRepo = patientRepo;
        this.glucoseRepo = glucoseRepo;
    }

    @GetMapping("/list")
    public List<Glucose> list(){return glucoseRepo.findAll();}

    @GetMapping("/{id}")
    public EntityModel<Glucose> show(@PathVariable int id) throws Exception{
        Optional<Glucose> glucose = glucoseRepo.findById(id);
        if(glucose.isEmpty()){
            throw new Exception("not found");
        }
        EntityModel<Glucose> glucoseEntityModel = EntityModel.of(glucose.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(methodOn(this.getClass()));
        glucoseEntityModel.add(link.withRel("list"));
        return glucoseEntityModel;
    }

    @PostMapping("/{pid}/new")
    public ResponseEntity<Glucose> create(@RequestBody Glucose glucose, @PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        glucose.setPatient(patient.get());
        Glucose newGlucose = (Glucose) glucoseRepo.save(glucose);
        String glucoseid = String.valueOf(newGlucose.getGlucose_id());
        URI loc = URI.create("/"+id+"/"+glucoseid);
        return ResponseEntity.created(loc).build();
    }

    @GetMapping("/{pid}")
    public List<Glucose> getGlucoseForPatient(@PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getGlucoseTests();
    }



}

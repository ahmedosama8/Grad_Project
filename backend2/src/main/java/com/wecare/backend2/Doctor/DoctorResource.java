package com.wecare.backend2.Doctor;

import com.wecare.backend2.CBC.CBC;
import com.wecare.backend2.Glucose.Glucose;
import com.wecare.backend2.LipidProfile.LipidProfile;
import com.wecare.backend2.LiverFunc.LiverFunc;
import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.Tests.Tests;
import com.wecare.backend2.UrineTest.UrineTest;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.print.Doc;
import java.net.URI;
import java.sql.Array;
import java.util.*;

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

    @GetMapping("/{id}/patients")
    public ResponseEntity<Set<Patient>> getPatients(@PathVariable int id){
        Optional<Doctor> doctor = doctorRepo.findById(id);
        if(doctor.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(doctor.get().getPatients());
    }
    
    @GetMapping("/{id}/tests")
    public ResponseEntity<Tests> getTests(@PathVariable int id){
        Optional<Doctor> doctor = doctorRepo.findById(id);
        if(doctor.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        List<CBC> cbcTests = doctor.get().getCbcTests();
        List<Glucose> glucoses = doctor.get().getGlucoseTests();
        List<LipidProfile> lipidProfiles = doctor.get().getLipidProfileTests();
        List<LiverFunc> liverFuncs = doctor.get().getLiverFuncTests();
        List<UrineTest> urineTests = doctor.get().getUrineTests();

        return ResponseEntity.ok(new Tests(cbcTests, glucoses, lipidProfiles, liverFuncs, urineTests));


    }

    @PostMapping("/new")
    public ResponseEntity<Doctor> create(@RequestBody Doctor doctor){
        Doctor newDoctor = doctorRepo.save(doctor);
        String id = String.valueOf(newDoctor.getDoctor_id());
        URI loc = URI.create("/"+id);
        return ResponseEntity.created(loc).build();
    }

}

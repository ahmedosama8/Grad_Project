package com.wecare.backend2.CBC;

import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Doctor.DoctorRepository;
import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.Patient.PatientRepository;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.hateoas.EntityModel;

import javax.print.Doc;
import java.net.URI;
import java.util.List;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;


@RestController
@RequestMapping("/CBC")
public class CBCResource {

    private PatientRepository patientRepo;
    private DoctorRepository doctorRepository;
    private CBCRepository cbcRepository;



    public CBCResource(PatientRepository patientRepo, CBCRepository cbcRepository, DoctorRepository doctorRepository) {
        this.patientRepo = patientRepo;
        this.doctorRepository = doctorRepository;
        this.cbcRepository = cbcRepository;
    }

    @GetMapping("/list")
    public List<CBC> list(){return cbcRepository.findAll();}


    @GetMapping("/test/{id}")
    public EntityModel<CBC> show(@PathVariable int id) throws Exception{
        Optional<CBC> cbc = cbcRepository.findById(id);
        if(cbc.isEmpty()){
            throw new Exception("not found");
        }
        EntityModel<CBC> cbcEntityModel = EntityModel.of(cbc.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(methodOn(this.getClass()));
        cbcEntityModel.add(link.withRel("list"));
        return cbcEntityModel;
    }

    @PostMapping("/{id}/new")
    public ResponseEntity<CBC> create(@RequestBody CBC cbc, @PathVariable int id, @RequestParam("doctor") String doctor_id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        Optional<Doctor> doctor = doctorRepository.findById(Integer.parseInt(doctor_id));
        if(patient.isEmpty() || doctor.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        cbc.setPatient(patient.get());
        cbc.setDoctor(doctor.get());

        Patient patient1 = patient.get();
        Doctor doctor1 = doctor.get();

        patient1.getCBCTests().add(cbc);
        doctor1.getCbcTests().add(cbc);


        patientRepo.save(patient1);
        doctorRepository.save(doctor1);


        CBC newCBC = (CBC) cbcRepository.save(cbc);
        String cbcid = String.valueOf(newCBC.getCbc_id());
        URI loc = URI.create("/"+id+"/"+cbcid);
        return ResponseEntity.created(loc).build();
    }


    @GetMapping("/patient/{id}")
    public List<CBC> getCBCForPatient(@PathVariable int id) throws Exception{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getCBCTests();
    }



}

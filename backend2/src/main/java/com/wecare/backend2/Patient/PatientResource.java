package com.wecare.backend2.Patient;

import com.wecare.backend2.Backend2Application;
import com.wecare.backend2.Doctor.DoctorRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.hateoas.EntityModel;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.net.URI;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/patient")
public class PatientResource {

    private PatientRepository patientRepo;
    private DoctorRepository doctorRepository;

    @GetMapping("/list")
    public List<Patient> list(){
        return patientRepo.findAll();
    }




    @PostMapping("/{id}/image")
    public ResponseEntity<Patient> uploadImage(@PathVariable int id, @RequestParam("image") MultipartFile multipartFile) throws IOException{
        Optional<Patient> patient = patientRepo.findById(id);
        if(patient.isPresent()){
            String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
            Patient patient1 = patient.get();
            patient1.setImage(fileName);
            patientRepo.save(patient1);
            String uploadDir = "user-photos/"+id;
            FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }




}

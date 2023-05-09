package com.wecare.backend2.Appointment;


import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Doctor.DoctorRepository;
import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.Patient.PatientRepository;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.print.Doc;
import java.net.URI;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/appointment")
public class AppointmentResource {

    private AppointmentRepository appointmentRepo;
    private DoctorRepository doctorRepository;
    private PatientRepository patientRepository;

    public AppointmentResource(AppointmentRepository appointmentRepo, PatientRepository patientRepository, DoctorRepository doctorRepository) {
        this.appointmentRepo = appointmentRepo;
        this.doctorRepository = doctorRepository;
        this.patientRepository = patientRepository;
    }

    @GetMapping("/list")
    public List<Appointment> list(){return appointmentRepo.findAll();}

    @GetMapping("/{id}")
    public EntityModel<Appointment> show(@PathVariable Long id) throws Exception{
        Optional<Appointment> appointment = appointmentRepo.findById(id);
        if(appointment.isEmpty()){
            throw new Exception(("id"));
        }
     EntityModel<Appointment> appointmentEntity = EntityModel.of(appointment.get());
        WebMvcLinkBuilder link = WebMvcLinkBuilder.linkTo(WebMvcLinkBuilder.methodOn(this.getClass()).list());
        appointmentEntity.add(link.withRel("list-appointments"));
        return appointmentEntity;
    }

    @PostMapping("/{pid}/new")
    public ResponseEntity<Appointment> create(@RequestBody Appointment appointment, @PathVariable int pid, @RequestParam("lab") String doctor_id) throws Exception{
        Optional<Patient> patient = patientRepository.findById(pid);
        Optional<Doctor> doctor = doctorRepository.findById(Integer.parseInt(doctor_id));
        if(patient.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        if(doctor.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        Patient patient1 = patient.get();
        Doctor doctor1 = doctor.get();
        Appointment newAppointment = appointmentRepo.save(appointment);
        patient1.getDoctors().add(doctor.get());
        doctor1.getPatients().add(patient.get());
        appointment.setPatient(patient1);
        appointment.setDoctor(doctor1);

        patientRepository.save(patient1);
        doctorRepository.save(doctor1);

        String id = String.valueOf(newAppointment.getAppointmentId());
        URI loc = URI.create("/"+id);
        return ResponseEntity.created(loc).build();
    }

    @GetMapping("/patient/{pid}")
    public List<Appointment> getAppointmentsForPatient(@PathVariable int pid) throws Exception{
        Optional<Patient> patient = patientRepository.findById(pid);
        if(patient.isEmpty()){
            throw new Exception("not found");
        }
        return patient.get().getAppointments();
    }



}

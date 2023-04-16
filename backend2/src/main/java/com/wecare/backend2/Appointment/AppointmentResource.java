package com.wecare.backend2.Appointment;


import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/appointment")
public class AppointmentResource {

    private AppointmentRepository appointmentRepo;

    public AppointmentResource(AppointmentRepository appointmentRepo) {
        this.appointmentRepo = appointmentRepo;
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

    @PostMapping("/new")
    public ResponseEntity<Appointment> create(@RequestBody Appointment appointment){
        Appointment newAppointment = appointmentRepo.save(appointment);
        String id = String.valueOf(newAppointment.getAppointmentId());
        URI loc = URI.create("/"+id);
        return ResponseEntity.created(loc).build();
    }

}

package com.wecare.backend2;

import com.wecare.backend2.ExcelService.ExcelService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Backend2Application implements CommandLineRunner {

    private ExcelService excelService;

    public Backend2Application(ExcelService excelService) {
        this.excelService = excelService;
    }


    public static void main(String[] args) {
        SpringApplication.run(Backend2Application.class, args);
    }

    @Override
    public void run(String... args) throws Exception{
        excelService.seedExcelData();
    }
}

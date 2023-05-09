package com.wecare.backend2.ExcelService;

import com.wecare.backend2.Diagnosis.Diagnosis;
import com.wecare.backend2.Diagnosis.DiagnosisRepository;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public final class ExcelService {

    @Value("${excel.path}")
    private String excelPath;

    private DiagnosisRepository diagnosisRepository;

    public ExcelService(DiagnosisRepository diagnosisRepository) {
        this.diagnosisRepository = diagnosisRepository;
    }

    public void seedExcelData() throws IOException {
        FileInputStream file = new FileInputStream(new File(excelPath));

        Workbook workbook = new XSSFWorkbook(file);
        Sheet sheet = workbook.getSheetAt(0);

        List<Diagnosis> entities = new ArrayList<>();
        for (Row row : sheet) {
            Diagnosis diagnosis = new Diagnosis();
            diagnosis.setCode(row.getCell(0).getStringCellValue());
            diagnosis.setDiagnosis(row.getCell(1).getStringCellValue());
            entities.add(diagnosis);
        }

        diagnosisRepository.saveAll(entities);

        workbook.close();
    }
}
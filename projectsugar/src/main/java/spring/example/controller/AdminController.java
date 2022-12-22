package spring.example.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import spring.example.domain.User;
import spring.example.service.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService service;

	@GetMapping("/mem/info")
	public void memsInfo(HttpServletResponse response) {

		String fileName = "";
		try {
			fileName = new String("회원 명단.xlsx".getBytes("utf-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");

		List<User> mlist = service.memsInfo();

		Workbook workbook = new SXSSFWorkbook(); 

		Sheet sheet = workbook.createSheet("첫번째 시트");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("userid");
		cell = row.createCell(1);
		cell.setCellValue("name");
		cell = row.createCell(2);
		cell.setCellValue("pr");
		cell = row.createCell(3);
		cell.setCellValue("address");
		cell = row.createCell(4);
		cell.setCellValue("nickname");
		cell = row.createCell(5);
		cell.setCellValue("level");

		
		
		
		for (int i = 0; i < mlist.size(); i++) {
			row = sheet.createRow(rowNum++);
			User m = mlist.get(i);
			cell = row.createCell(0);
			cell.setCellValue(m.getUserid());
			cell = row.createCell(1);
			cell.setCellValue(m.getName());
			cell = row.createCell(2);
			cell.setCellValue((m.getPr()));
			cell = row.createCell(3);
			cell.setCellValue(m.getAddress());
			cell = row.createCell(4);
			cell.setCellValue(m.getNickname());
			cell = row.createCell(5);
			cell.setCellValue(m.getLevel());
		}

		
		
		
		try {
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


}

package spring.example.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Ban {

	private int bno;
	private int pno;
	private String btitle;
	private String userid;
	private String btext;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date btime;
}

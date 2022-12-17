package spring.example.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Post {

	private int pno;
	private String ptitle;
	private String userid;
	private String ptext;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date ptime;
	private int pview;
}

package spring.example.domain;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Comment {
	private int cno;
	private int pno;
	private String userid;
	private String content;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date ctime;
	private int parent_cno;
}	

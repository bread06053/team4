package spring.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdBoard {
	private Integer bno;
	private String btitle;
	private String btext;
	private Date btime;
	private String userid;
	private int pno;
}

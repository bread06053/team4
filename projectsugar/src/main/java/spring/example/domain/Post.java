package spring.example.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Post {
    private int pno;
    private String ptitle;
    private String userid;
    private String ptext;
    private int pview;
    private LocalDateTime ptime;
}

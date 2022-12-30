package spring.example.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
    private String userid;
    private String passwd;
    private String name;

    private Date regDate;

    private String email;
    private String tel;
  //  private List<AuthVO> authList;

    private String snsId;
}

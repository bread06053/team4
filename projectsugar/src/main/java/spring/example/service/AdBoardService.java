package spring.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import spring.example.domain.AdBoard;

public interface AdBoardService {
    int getCount() throws Exception;
    int remove(Integer bno) throws Exception;
    int write(AdBoard boardDto) throws Exception;
    List<AdBoard> getList() throws Exception;
    AdBoard read(Integer bno) throws Exception;
    List<AdBoard> selectPage(Map map) throws Exception;
    int modify(AdBoard boardDto) throws Exception;
}

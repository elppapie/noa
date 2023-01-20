package com.nodearchive.springapp.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.MeetingResrvDTO;
import com.nodearchive.springapp.service.impl.MeetingResrvDAO;
import com.nodearchive.springapp.service.impl.MeetingRoomDTO;
import com.nodearchive.springapp.service.impl.PageInfo;

@Service("mrService")
public class MeetingResrvServiceImpl implements MeetingResrvService {
    
    @Autowired
    private MeetingResrvDAO mrDAO;
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public int getListCount() {
        return mrDAO.getListCount(sqlSession);
    }
    
    @Override
    public ArrayList<MeetingResrvDTO> selectList(PageInfo pi) {
        return mrDAO.selectList(sqlSession, pi);
    }
    
    @Override
    public int getMyListCount(String mId) {
        return mrDAO.getMyListCount(sqlSession, mId);
    }
    
    @Override
    public ArrayList<MeetingResrvDTO> selectMyList(HashMap map) {
        return mrDAO.selectMyList(sqlSession, map);
    }
    
    @Override
    public int insertMeetingResrv(MeetingResrvDTO mr) {
        return mrDAO.insertMeetingResrv(sqlSession, mr);
    }
    
    @Override
    public ArrayList<MeetingRoomDTO> selectRoomList(HashMap map) {
        return mrDAO.selectRoomList(sqlSession, map);
    }
    
    @Override
    public int autoUpdate(Timestamp tNow) {
        return mrDAO.autoUpdate(sqlSession, tNow);
    }
    
    @Override
    public int searchListCount(HashMap map) {
        return mrDAO.searchListCount(sqlSession, map);
    }
    
    @Override
    public ArrayList<MeetingResrvDTO> searchList(PageInfo pi, HashMap map) {
        return mrDAO.searchList(sqlSession, pi, map);
    }
    
    @Override
    public int searchMyListCount(HashMap map) {
        return mrDAO.searchMyListCount(sqlSession, map);
    }
    
    @Override
    public ArrayList<MeetingResrvDTO> searchMyList(PageInfo pi, HashMap map) {
        return mrDAO.searchMyList(sqlSession, pi, map);
    }
    
    @Override
    public MeetingResrvDTO selectMeetingResrv(int rNo) {
        return mrDAO.selectMeetingResrv(sqlSession, rNo);
    }
    
    @Override
    public int updateMeetingResrv(MeetingResrvDTO mr) {
        return mrDAO.updateMeetingResrv(sqlSession, mr);
    }
    
    @Override
    public int completeMeetingResrv(int rNo) {
        return mrDAO.completeMeetingResrv(sqlSession, rNo);
    }
    
    @Override
    public int cancelMeetingResrv(int rNo) {
        return mrDAO.cancelMeetingResrv(sqlSession, rNo);
    }
    
    @Override
    public int completesMeetingResrv(List<Integer> chksList) {
        return mrDAO.completesMeetingResrv(sqlSession, chksList);
    }
    
    @Override
    public int cancelsMeetingResrv(List<Integer> chksList) {
        return mrDAO.cancelsMeetingResrv(sqlSession, chksList);
    }
    
    @Override
    public MeetingRoomDTO selectMeetingRoom(String mr_code) {
        return mrDAO.selectMeetingRoom(sqlSession, mr_code);
    }
    
    @Override
    public ArrayList<MeetingResrvDTO> selectList() {
        return mrDAO.selectList(sqlSession);
    }
    
}

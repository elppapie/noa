package com.nodearchive.springapp.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.nodearchive.springapp.service.impl.MeetingResrvDTO;
import com.nodearchive.springapp.service.impl.MeetingRoomDTO;
import com.nodearchive.springapp.service.impl.PageInfo;

public interface MeetingResrvService {
    
    int getListCount();
    
    ArrayList<MeetingResrvDTO> selectList(PageInfo pi);
    
    int getMyListCount(String mId);
    
    ArrayList<MeetingResrvDTO> selectMyList(HashMap map);
    
    int insertMeetingResrv(MeetingResrvDTO mr);
    
    ArrayList<MeetingRoomDTO> selectRoomList(HashMap map);
    
    int autoUpdate(Timestamp tNow);
    
    int searchListCount(HashMap map);
    
    ArrayList<MeetingResrvDTO> searchList(PageInfo pi, HashMap map);
    
    int searchMyListCount(HashMap map);
    
    ArrayList<MeetingResrvDTO> searchMyList(PageInfo pi, HashMap map);
    
    MeetingResrvDTO selectMeetingResrv(int rNo);
    
    int updateMeetingResrv(MeetingResrvDTO mr);
    
    int completeMeetingResrv(int rNo);
    
    int cancelMeetingResrv(int rNo);
    
    int completesMeetingResrv(List<Integer> chksList);
    
    int cancelsMeetingResrv(List<Integer> chksList);
    
    MeetingRoomDTO selectMeetingRoom(String mr_code);
    
    ArrayList<MeetingResrvDTO> selectList();
    
}


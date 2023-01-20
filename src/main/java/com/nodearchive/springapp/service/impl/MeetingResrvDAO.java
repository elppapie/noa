package com.nodearchive.springapp.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mrDAO")
public class MeetingResrvDAO {
    
    public int getListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("mappers.meet.getListCount");
    }
    
    public ArrayList<MeetingResrvDTO> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return (ArrayList) sqlSession.selectList("mappers.meet.selectList", pi, rowBounds);
    }
    
    public int getMyListCount(SqlSessionTemplate sqlSession, String mId) {
        return sqlSession.selectOne("mappers.meet.getMyListCount", mId);
    }
    
    public ArrayList<MeetingResrvDTO> selectMyList(SqlSessionTemplate sqlSession, HashMap map) {
        int offset = (((PageInfo) map.get("pi2")).getCurrentPage() - 1) * ((PageInfo) map.get("pi2")).getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, ((PageInfo) map.get("pi2")).getBoardLimit());
        
        return (ArrayList) sqlSession.selectList("mappers.meet.selectMyList", map, rowBounds);
    }
    
    public int insertMeetingResrv(SqlSessionTemplate sqlSession, MeetingResrvDTO mr) {
        return sqlSession.insert("mappers.meet.insertMeetResrv", mr);
    }
    
    public ArrayList<MeetingRoomDTO> selectRoomList(SqlSessionTemplate sqlSession, HashMap map) {
        return (ArrayList) sqlSession.selectList("mappers.meet.selectRoomList", map);
    }
    
    public int autoUpdate(SqlSessionTemplate sqlSession, Timestamp tNow) {
        return sqlSession.update("mappers.meet.autoUpdate", tNow);
    }
    
    public int searchListCount(SqlSessionTemplate sqlSession, HashMap map) {
        return sqlSession.selectOne("mappers.meet.searchListCount", map);
    }
    
    public ArrayList<MeetingResrvDTO> searchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return (ArrayList) sqlSession.selectList("mappers.meet.searchList", map, rowBounds);
    }
    
    public int searchMyListCount(SqlSessionTemplate sqlSession, HashMap map) {
        return sqlSession.selectOne("mappers.meet.searchMyListCount", map);
    }
    
    public ArrayList<MeetingResrvDTO> searchMyList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return (ArrayList) sqlSession.selectList("mappers.meet.searchMyList", map, rowBounds);
    }
    
    public MeetingResrvDTO selectMeetingResrv(SqlSessionTemplate sqlSession, int rNo) {
        return sqlSession.selectOne("mappers.meet.selectMeetingResrv", rNo);
    }
    
    public int updateMeetingResrv(SqlSessionTemplate sqlSession, MeetingResrvDTO mr) {
        return sqlSession.update("mappers.meet.updateMeetingResrv", mr);
    }
    
    public int completeMeetingResrv(SqlSessionTemplate sqlSession, int rNo) {
        return sqlSession.update("mappers.meet.completeMeetingResrv", rNo);
    }
    
    public int cancelMeetingResrv(SqlSessionTemplate sqlSession, int rNo) {
        return sqlSession.update("mappers.meet.cancelMeetingResrv", rNo);
    }
    
    public int completesMeetingResrv(SqlSessionTemplate sqlSession, List<Integer> chksList) {
        return sqlSession.update("mappers.meet.completesMeetingResrv", chksList);
    }
    
    public int cancelsMeetingResrv(SqlSessionTemplate sqlSession, List<Integer> chksList) {
        return sqlSession.update("mappers.meet.cancelsMeetingResrv", chksList);
    }
    
    public MeetingRoomDTO selectMeetingRoom(SqlSessionTemplate sqlSession, String mr_code) {
        return sqlSession.selectOne("mappers.meet.selectMeetRoom", mr_code);
    }
    
    public ArrayList<MeetingResrvDTO> selectList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("mappers.meet.selectList");
    }
    
}


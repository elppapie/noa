package com.nodearchive.springapp.web;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.nodearchive.springapp.service.MeetingResrvService;
import com.nodearchive.springapp.service.impl.MeetingResrvDTO;
import com.nodearchive.springapp.service.impl.MeetingRoomDTO;
import com.nodearchive.springapp.service.impl.PageInfo;
import com.nodearchive.springapp.service.impl.Search;
import com.nodearchive.springapp.service.utils.Pagination;


@Controller
public class MeetingResrvController {
    
    @Autowired
    private MeetingResrvService mrService;
    
    // 예약 목록 조회(전체 + 내)
    @RequestMapping("/Meet/list.kosmo")
    public ModelAndView meetingRoomResrvList(@RequestParam(value = "page1", required = false) Integer page1,
            @RequestParam(value = "page2", required = false) Integer page2, ModelAndView mv, HttpSession session) {
        // 예약 종료 시간 이후에는 자동적으로 사용 완료로 변경
        Timestamp tNow = new Timestamp(System.currentTimeMillis());
        
        mrService.autoUpdate(tNow);
        
        // 전체 예약 목록 조회
        int currentPage1 = 1;
        if (page1 != null)
            currentPage1 = page1;
        
        int listCount1 = mrService.getListCount();
        
        PageInfo pi1 = Pagination.getPageInfo(currentPage1, listCount1);
        
        ArrayList<MeetingResrvDTO> list1 = mrService.selectList(pi1);
        
        // 내 예약 목록 조회
        int currentPage2 = 1;
        if (page2 != null)
            currentPage2 = page2;
        
        /*String loginUserId = ((Member) session.getAttribute("loginUser")).getM_id();*/
        
        int listCount2 = mrService.getMyListCount("hong1234@samsung.com");
        
        PageInfo pi2 = Pagination.getPageInfo(currentPage2, listCount2);
        
        HashMap map = new HashMap();
        map.put("m_id", "hong1234@samsung.com");
        map.put("pi2", pi2);
        
        ArrayList<MeetingResrvDTO> list2 = mrService.selectMyList(map);
        
        // view에 출력할 예약날짜 형태 설정(Rev_time)
        SimpleDateFormat sdf_date = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf_time = new SimpleDateFormat("HH:mm");
        
        for (MeetingResrvDTO meetingResrv : list1) {
            Date mrr_date = meetingResrv.getMrr_date();
            Timestamp sche_startdate = meetingResrv.getSche_startdate();
            Timestamp sche_enddate = meetingResrv.getSche_enddate();
            
            meetingResrv.setRev_time(sdf_date.format(mrr_date) + "   " + sdf_time.format(sche_startdate) + " ~ "
                    + sdf_time.format(sche_enddate));
        }
        
        for (MeetingResrvDTO meetingResrv : list2) {
            Date rev_date = meetingResrv.getMrr_date();
            Timestamp rev_start_time = meetingResrv.getSche_startdate();
            Timestamp rev_end_time = meetingResrv.getSche_enddate();
            
            meetingResrv.setRev_time(sdf_date.format(rev_date) + "   " + sdf_time.format(rev_start_time) + " ~ "
                    + sdf_time.format(rev_end_time));
        }
        
        // view로 데이터 전달
        if (list1 != null && list2 != null) {
            mv.addObject("searchCondition", null);
            mv.addObject("searchKeyword", null);
            
            mv.addObject("searchPi1", null);
            mv.addObject("searchList1", null);
            
            mv.addObject("searchPi2", null);
            mv.addObject("searchList2", null);
            
            mv.addObject("pi1", pi1);
            mv.addObject("list1", list1);
            
            mv.addObject("pi2", pi2);
            mv.addObject("list2", list2);
            
            mv.setViewName("/meet/meetListView.noa");
        } else
            throw new MeetingResrvException("예약 내역 조회에 실패하였습니다.");
        
        return mv;
    }
    
    /*// 예약 캘린더 페이지 연결
    @RequestMapping("/Meet/calview.kosmo")
    public String meetingResrvCalView() {
        return "meet/meetCalcView.noa";
    }
    
    // 예약 캘린더 용 데이터 전송(ajax)
    @RequestMapping(value = "mrcal.mr", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String meetingResrvCal() {
        // 예약 종료 시간 이후에는 자동적으로 사용 완료로 변경
        Timestamp tNow = new Timestamp(System.currentTimeMillis());
        
        mrService.autoUpdate(tNow);
        
        ArrayList<MeetingResrv> list = mrService.selectList();
        
        Gson gson = new Gson();
        
        return gson.toJson(list);
    }*/
    
    // 예약 신청 페이지 연결
    @RequestMapping("/Meet/insertview.kosmo")
    public String meetingResrvInsertView() {
        return "meet/meetResrvInsertForm.noa";
    }
    
    // 예약 신청
    @RequestMapping("insert.mr")
    public String meetingResrvInsert(@RequestParam("datepicker") Date r_date,
            @RequestParam("r_start_time") String r_start_time, @RequestParam("r_end_time") String r_end_time,
            @RequestParam("r_room") String r_room, @RequestParam("r_content") String r_content, HttpSession session) {
        // 예약 정보 입력
        MeetingResrvDTO mr = new MeetingResrvDTO();
        
        mr.setMrr_date(r_date);   // 예약 날짜 입력
        
        // Timestamp 양식으로 변하기 위한 조건(예시 : String timeStr = "2022-01-01 12:30:00.0";)으로 변경
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String start_time = sdf.format(r_date) + " " + r_start_time + ":00";
        String end_time = sdf.format(r_date) + " " + r_end_time + ":00";
        
        mr.setSche_startdate(Timestamp.valueOf(start_time));    // 예약 시작시간 입력
        mr.setSche_enddate(Timestamp.valueOf(end_time));    // 예약 종료 시간 입력
        mr.setMrr_content(r_content);   // 예약목적 내용 입력
        mr.setMr_code(r_room);  // 예약 회의실 번호 입력
        mr.setM_id(/*((Member) session.getAttribute("loginUser")).getM_id()*/"hong1234@samsung.com");   // 예약자 아이디 입력
        
        int result = mrService.insertMeetingResrv(mr);
        
        if (result > 0)
            return "redirect:/Meet/list.kosmo";
        else
            throw new MeetingResrvException("회의실 예약 등록에 실패하였습니다.");
    }
    
    // 예약 신청 시 가능한 회의실 조회(ajax)
    @RequestMapping(value = "mrcheckrooms.mr", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String checkRooms(@RequestParam("inputDate") Date inputDate,
            @RequestParam("inputStartTime") String inputStartTime, @RequestParam("inputEndTime") String inputEndTime) {
        // 입력된 날짜, 시간 정보 담기
        HashMap map = new HashMap();
        
        // Timestamp 양식으로 변하기 위한 조건(예시 : String timeStr = "2022-01-01 12:30:00.0";)으로 변경
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String start_time = sdf.format(inputDate) + " " + inputStartTime + ":00";
        String end_time = sdf.format(inputDate) + " " + inputEndTime + ":00";
        
        map.put("inputDate", inputDate);
        map.put("inputStartTime", Timestamp.valueOf(start_time));
        map.put("inputEndTime", Timestamp.valueOf(end_time));
        
        ArrayList<MeetingRoomDTO> list = mrService.selectRoomList(map);
        
        Gson gson = new Gson();
        
        return gson.toJson(list);
    }
    
    // 예약 수정 시 가능한 회의실 조회(ajax)
    @RequestMapping(value = "mrcheckroomsupdate.mr", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String checkRoomsUpdate(@RequestParam("inputDate") Date inputDate,
            @RequestParam("inputStartTime") String inputStartTime, @RequestParam("inputEndTime") String inputEndTime,
            @RequestParam("rNo") int rNo) {
        // 입력된 날짜, 시간 정보 담기
        HashMap map = new HashMap();
        
        // Timestamp 양식으로 변하기 위한 조건(예시 : String timeStr = "2022-01-01 12:30:00.0";)으로 변경
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String start_time = sdf.format(inputDate) + " " + inputStartTime + ":00";
        String end_time = sdf.format(inputDate) + " " + inputEndTime + ":00";
        
        map.put("inputDate", inputDate);
        map.put("inputStartTime", Timestamp.valueOf(start_time));
        map.put("inputEndTime", Timestamp.valueOf(end_time));
        map.put("rNo", rNo);
        
        ArrayList<MeetingRoomDTO> list = mrService.selectRoomList(map);
        
        Gson gson = new Gson();
        
        return gson.toJson(list);
    }
    
    // 예약 내역 세부 조회
    @RequestMapping("mrdetail.mr")
    public String meetingDetail(@RequestParam("rNo") int rNo, @RequestParam("page1") int page1, Model model,
            @RequestParam("cal") int cal) {
        MeetingResrvDTO mr = mrService.selectMeetingResrv(rNo);
        MeetingRoomDTO mInfo = mrService.selectMeetingRoom(mr.getMr_code());
        
        if (mr != null) {
            model.addAttribute("mr", mr);
            model.addAttribute("page1", page1);
            model.addAttribute("mInfo", mInfo);
            model.addAttribute("cal", cal);
        } else
            throw new MeetingResrvException("예약 정보 상세 조회에 실패하였습니다.");
        
        return "meet/meetDetailView";
    }
    
    // 예약 내역 수정 페이지 연결
    @RequestMapping("mrupdateview.mr")
    public String meetingResrvUpdateView(@RequestParam("rNo") int rNo, @RequestParam("page2") int page2, Model model,
            @RequestParam("cal") int cal) {
        MeetingResrvDTO mr = mrService.selectMeetingResrv(rNo);
        
        model.addAttribute("mr", mr).addAttribute("rNo", rNo).addAttribute("page2", page2).addAttribute("cal", cal);
        
        return "meetResrvUpdateForm";
    }
    
    // 예약 내역 수정(입력 정보)
    @RequestMapping("mrupdate.mr")
    public String meetingResrvUpdate(@RequestParam("r_no") int r_no, @RequestParam("page2") int page2,
            @RequestParam("datepicker") Date r_date, @RequestParam("r_start_time") String r_start_time,
            @RequestParam("r_end_time") String r_end_time, @RequestParam("r_room") String r_room,
            @RequestParam("r_content") String r_content, HttpSession session, Model model,
            @RequestParam("cal") int cal) {
        // 예약 정보 입력
        MeetingResrvDTO mr = new MeetingResrvDTO();
        
        mr.setMrr_no(r_no);  // 예약 번호 입력
        mr.setMrr_date(r_date);   // 예약 날짜 입력
        
        // Timestamp 양식으로 변하기 위한 조건(예시 : String timeStr = "2022-01-01 12:30:00.0";)으로 변경
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String start_time = sdf.format(r_date) + " " + r_start_time + ":00";
        String end_time = sdf.format(r_date) + " " + r_end_time + ":00";
        
        mr.setSche_startdate(Timestamp.valueOf(start_time));    // 예약 시작시간 입력
        mr.setSche_enddate(Timestamp.valueOf(end_time));    // 예약 종료 시간 입력
        mr.setMrr_content(r_content);   // 예약목적 내용 입력
        mr.setMr_code(r_room);  // 예약 회의실 번호 입력
        mr.setM_id(/*((Member) session.getAttribute("loginUser")).getM_id()*/"hong1234@samsung.com");   // 예약자 아이디 입력
        
        int result = mrService.updateMeetingResrv(mr);
        
        if (result > 0) {
            int page1 = 1;
            model.addAttribute("page1", page1);
            model.addAttribute("page2", page2);
            model.addAttribute("cal", cal);
        } else
            throw new MeetingResrvException("회의실 예약 수정에 실패하였습니다.");
        
        return "redirect:mrdetail.mr?rNo=" + mr.getMrr_no();
    }
    
    // 사용 완료 상태로 변경(수정 페이지: 1개)
    @RequestMapping("mrcomplete.mr")
    public String meetingResrvComplete(@RequestParam("rNo") int rNo, @RequestParam("page2") int page2, Model model,
            @RequestParam("cal") int cal) {
        int result = mrService.completeMeetingResrv(rNo);
        
        if (result > 0) {
            int page1 = 1;
            model.addAttribute("page1", page1);
            model.addAttribute("page2", page2);
            model.addAttribute("cal", cal);
        } else
            throw new MeetingResrvException("회의실 예약 상태 수정(사용 완료)에 실패하였습니다.");
        
        return "redirect:mrdetail.mr?rNo=" + rNo;
    }
    
    // 사용 완료 상태로 변경(조회 페이지: 1개 이상)
    @RequestMapping(value = "mrcompletes.mr", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String meetingResrvCompletes(@RequestParam(value = "chks[]") List<Integer> chksList) {
        int result = mrService.completesMeetingResrv(chksList);
        
        if (result > 0)
            return "successCompletes";
        else
            return "errorCompletes";
    }
    
    // 예약 취소 상태로 변경(수정 페이지: 1개)
    @RequestMapping("mrcancel.mr")
    public String meetingResrvCancel(@RequestParam("rNo") int rNo, @RequestParam("page2") int page2, Model model,
            @RequestParam("cal") int cal) {
        int result = mrService.cancelMeetingResrv(rNo);
        
        if (result > 0) {
            int page1 = 1;
            model.addAttribute("page1", page1);
            model.addAttribute("page2", page2);
            model.addAttribute("cal", cal);
        } else
            throw new MeetingResrvException("회의실 예약 상태 수정(예약 취소)에 실패하였습니다.");
        
        return "redirect:mrdetail.mr?rNo=" + rNo;
    }
    
    // 예약 취소 상태로 변경(조회 페이지: 1개 이상)
    @RequestMapping(value = "mrcancels.mr", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String meetingResrvCancels(@RequestParam(value = "chks[]") List<Integer> chksList) {
        int result = mrService.cancelsMeetingResrv(chksList);
        
        if (result > 0)
            return "successCancels";
        else
            return "errorCancels";
    }
    
    // 검색 목록 조회
    @RequestMapping("mrsearch.mr")
    public ModelAndView meetingRoomResrvSearchList(@RequestParam(value = "page1", required = false) Integer page1,
            @RequestParam(value = "page2", required = false) Integer page2, Search search, ModelAndView mv,
            HttpSession session) {
        // 예약 종료 시간 이후에는 자동적으로 사용 완료로 변경
        Timestamp tNow = new Timestamp(System.currentTimeMillis());
        
        mrService.autoUpdate(tNow);
        
        // 검색어 미입력 시 전체 조회로 연결
        if (search.getSearchKeyword().trim().equals("") || search.getSearchKeyword() == null) {
            mv.setViewName("redirect:/Meet/list.kosmo");
            return mv;
        }
        
        String condition = search.getSearchCondition();
        String keyword = search.getSearchKeyword();
        
        HashMap map = new HashMap();
        map.clear();
        
        // 1: 전체 예약 목록 페이지에서 검색, 2: 내 예약 목록 페이지에서 검색
        int currentPage1 = 1;
        if (page1 != null)
            currentPage1 = page1;
        
        int currentPage2 = 1;
        if (page2 != null)
            currentPage2 = page2;
        
        /*String loginUserId = ((Member) session.getAttribute("loginUser")).getM_id();*/
        
        map.put("m_id", "hong1234@samsung.com");
        
        if (condition.equals("r_no")) {    // 예약번호로 검색 시
            int r_no = -1;  // 상태를 확인할 수 없는 값 초기 값 할당
            
            try {
                r_no = Integer.parseInt(keyword);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            map.put("searchCondition", condition);
            map.put("searchKeyword", r_no);
        } else if (condition.equals("r_date")) {   // 예약날짜로 검색 시
            Date r_date = null;  // 상태를 확인할 수 없는 값 초기 값 할당
            
            try {
                r_date = Date.valueOf(keyword);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            map.put("searchCondition", condition);
            map.put("searchKeyword", r_date);
        } else if (condition.equals("r_status")) {  // 예약상태로 검색 시
            int r_status = -1;  // 상태를 확인할 수 없는 값 초기 값 할당
            
            if (keyword.equals("예약 완료"))
                r_status = 0;
            else if (keyword.equals("사용 완료"))
                r_status = 1;
            else if (keyword.equals("예약 취소"))
                r_status = 2;
            
            map.put("searchCondition", condition);
            map.put("searchKeyword", r_status);
        } else if (condition.equals("r_meetName") || condition.equals("r_mName") || condition.equals("r_content")) {    // 회의실 명 또는 예약내용으로 검색 시
            map.put("searchCondition", condition);
            map.put("searchKeyword", keyword);
        }
        
        int searchListCount1 = mrService.searchListCount(map);
        
        PageInfo searchPi1 = Pagination.getPageInfo(currentPage1, searchListCount1);
        
        ArrayList<MeetingResrvDTO> searchList1 = mrService.searchList(searchPi1, map);
        
        int searchListCount2 = mrService.searchMyListCount(map);
        
        PageInfo searchPi2 = Pagination.getPageInfo(currentPage2, searchListCount2);
        
        ArrayList<MeetingResrvDTO> searchList2 = mrService.searchMyList(searchPi2, map);
        
        // view에 출력할 예약날짜 형태 설정(Rev_time)
        SimpleDateFormat sdf_date = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf_time = new SimpleDateFormat("HH:mm");
        
        for (MeetingResrvDTO meetingResrv : searchList1) {
            Date mrr_date = meetingResrv.getMrr_date();
            Timestamp sche_startdate = meetingResrv.getSche_startdate();
            Timestamp sche_enddate = meetingResrv.getSche_enddate();
            
            meetingResrv.setRev_time(sdf_date.format(mrr_date) + "   " + sdf_time.format(sche_startdate) + " ~ "
                    + sdf_time.format(sche_enddate));
        }
        
        for (MeetingResrvDTO meetingResrv : searchList2) {
            Date mrr_date = meetingResrv.getMrr_date();
            Timestamp sche_startdate = meetingResrv.getSche_startdate();
            Timestamp sche_enddate = meetingResrv.getSche_enddate();
            
            meetingResrv.setRev_time(sdf_date.format(mrr_date) + "   " + sdf_time.format(sche_startdate) + " ~ "
                    + sdf_time.format(sche_enddate));
        }
        
        // view로 데이터 전달
        if (searchList1 != null && searchList2 != null) {
            mv.addObject("pi1", null);
            mv.addObject("list1", null);
            
            mv.addObject("pi2", null);
            mv.addObject("list2", null);
            
            mv.addObject("searchCondition", condition);
            mv.addObject("searchKeyword", keyword);
            
            mv.addObject("searchPi1", searchPi1);
            mv.addObject("searchList1", searchList1);
            
            mv.addObject("searchPi2", searchPi2);
            mv.addObject("searchList2", searchList2);
            
            mv.setViewName("meetListView");
        } else
            throw new MeetingResrvException("예약 내역 검색에 실패하였습니다.");
        
        return mv;
    }
 
}

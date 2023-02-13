package com.nodearchive.springapp.service.impl;

import java.sql.Date;
import java.sql.Timestamp;

public class MeetingResrvDTO {
    private int mrr_no;                 // 예약 일련번호
    private int sche_no;                // 일정 일련번호
    private String m_id;                // 예약자 아이디
    private String mr_code;             // 예약한 회의실 코드       
    private Timestamp mrr_regidate;     // 예약 정보가 등록/수정된 시간
    private String mrr_content; 		// 예약목적(내용)
    private int mrr_status;             // 예약상태(0: 예약 완료, 1: 사용 완료, 2: 예약 취소)
    private Date mrr_date;              // 예약일
    private Timestamp mrr_starttime;    // 시작시간
    private Timestamp mrr_endtime;      // 종료시간
    
   
    private String mr_name;           	// 예약한 회의실 이름
    private String m_name;              // 예약자 이름
    
    private String rev_time;            // 예약날짜 정보(YYYY-MM-DD HH:MM ~ HH:MM)

	public MeetingResrvDTO() {

	}

	public MeetingResrvDTO(int mrr_no, int sche_no, String m_id, String mr_code, Timestamp mrr_regidate,
			String mrr_content, int mrr_status, Date mrr_date, Timestamp mrr_starttime, Timestamp mrr_endtime,
			String mr_name, String m_name, String rev_time) {
		super();
		this.mrr_no = mrr_no;
		this.sche_no = sche_no;
		this.m_id = m_id;
		this.mr_code = mr_code;
		this.mrr_regidate = mrr_regidate;
		this.mrr_content = mrr_content;
		this.mrr_status = mrr_status;
		this.mrr_date = mrr_date;
		this.mrr_starttime = mrr_starttime;
		this.mrr_endtime = mrr_endtime;
		this.mr_name = mr_name;
		this.m_name = m_name;
		this.rev_time = rev_time;
	}

	public int getMrr_no() {
		return mrr_no;
	}

	public void setMrr_no(int mrr_no) {
		this.mrr_no = mrr_no;
	}

	public int getSche_no() {
		return sche_no;
	}

	public void setSche_no(int sche_no) {
		this.sche_no = sche_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getMr_code() {
		return mr_code;
	}

	public void setMr_code(String mr_code) {
		this.mr_code = mr_code;
	}

	public Timestamp getMrr_regidate() {
		return mrr_regidate;
	}

	public void setMrr_regidate(Timestamp mrr_regidate) {
		this.mrr_regidate = mrr_regidate;
	}

	public String getMrr_content() {
		return mrr_content;
	}

	public void setMrr_content(String mrr_content) {
		this.mrr_content = mrr_content;
	}

	public int getMrr_status() {
		return mrr_status;
	}

	public void setMrr_status(int mrr_status) {
		this.mrr_status = mrr_status;
	}

	public Date getMrr_date() {
		return mrr_date;
	}

	public void setMrr_date(Date mrr_date) {
		this.mrr_date = mrr_date;
	}

	public Timestamp getMrr_starttime() {
		return mrr_starttime;
	}

	public void setMrr_starttime(Timestamp mrr_starttime) {
		this.mrr_starttime = mrr_starttime;
	}

	public Timestamp getMrr_endtime() {
		return mrr_endtime;
	}

	public void setMrr_endtime(Timestamp mrr_endtime) {
		this.mrr_endtime = mrr_endtime;
	}

	public String getMr_name() {
		return mr_name;
	}

	public void setMr_name(String mr_name) {
		this.mr_name = mr_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getRev_time() {
		return rev_time;
	}

	public void setRev_time(String rev_time) {
		this.rev_time = rev_time;
	}

	@Override
	public String toString() {
		return "MeetingResrvDTO [mrr_no=" + mrr_no + ", sche_no=" + sche_no + ", m_id=" + m_id + ", mr_code=" + mr_code
				+ ", mrr_regidate=" + mrr_regidate + ", mrr_content=" + mrr_content + ", mrr_status=" + mrr_status
				+ ", mrr_date=" + mrr_date + ", mrr_starttime=" + mrr_starttime + ", mrr_endtime=" + mrr_endtime
				+ ", mr_name=" + mr_name + ", m_name=" + m_name + ", rev_time=" + rev_time + "]";
	}

   
}

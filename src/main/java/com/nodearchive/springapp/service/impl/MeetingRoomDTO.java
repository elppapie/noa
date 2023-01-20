package com.nodearchive.springapp.service.impl;


public class MeetingRoomDTO {
    private String mr_code;
    private String emp_code;
    private String mr_name;
    private String mr_info;
    private int mr_status;
	
    public MeetingRoomDTO(String mr_code, String emp_code, String mr_name, String mr_info, int mr_status) {
		super();
		this.mr_code = mr_code;
		this.emp_code = emp_code;
		this.mr_name = mr_name;
		this.mr_info = mr_info;
		this.mr_status = mr_status;
	}

	public String getMr_code() {
		return mr_code;
	}

	public void setMr_code(String mr_code) {
		this.mr_code = mr_code;
	}

	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getMr_name() {
		return mr_name;
	}

	public void setMr_name(String mr_name) {
		this.mr_name = mr_name;
	}

	public String getMr_info() {
		return mr_info;
	}

	public void setMr_info(String mr_info) {
		this.mr_info = mr_info;
	}

	public int getMr_status() {
		return mr_status;
	}

	public void setMr_status(int mr_status) {
		this.mr_status = mr_status;
	}

	@Override
	public String toString() {
		return "MeetingRoom [mr_code=" + mr_code + ", emp_code=" + emp_code + ", mr_name=" + mr_name + ", mr_info="
				+ mr_info + ", mr_status=" + mr_status + "]";
	}

	
    
    
    

    
   
}

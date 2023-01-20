package com.nodearchive.springapp.web;

public class MeetingResrvException extends RuntimeException {
    public MeetingResrvException() {
    }
    
    public MeetingResrvException(String msg) {
        super(msg);
    }
}
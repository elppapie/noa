package com.nodearchive.springapp.service.impl;

public class Search {
    private String searchCondition;
    private String searchKeyword;
    
    public Search() {
    }
    
    public Search(String searchCondition, String searchKeyword) {
        this.searchCondition = searchCondition;
        this.searchKeyword = searchKeyword;
    }
    
    public String getSearchCondition() {
        return searchCondition;
    }
    
    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }
    
    public String getSearchKeyword() {
        return searchKeyword;
    }
    
    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }
    
    @Override
    public String toString() {
        return "Search [searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
    }
}
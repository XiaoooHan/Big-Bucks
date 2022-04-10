package com.ibm.security.appscan.altoromutual.model;

import java.sql.Timestamp;

public class HistoricalData {
    private String symbol;
    private Timestamp date;
    private double openPrice;
    private double highPrice;
    private double lowPrice;
    private double closePrice;

    public HistoricalData(String symbol, Timestamp date,double openPrice, double highPrice, double lowPrice, double closePrice) {
        this.symbol = symbol;
        this.date = date;
        this.openPrice= openPrice;
        this.highPrice = highPrice;
        this.lowPrice = lowPrice;
        this.closePrice = closePrice;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public double getOpenPrice() {
        return openPrice;
    }

    public void setOpenPrice(double openPrice) {
        this.openPrice = openPrice;
    }

    public double getHighPrice() {
        return highPrice;
    }

    public void setHighPrice(double highPrice) {
        this.highPrice = highPrice;
    }

    public double getLowPrice() {
        return lowPrice;
    }

    public void setLowPrice(double lowPrice) {
        this.lowPrice = lowPrice;
    }

    public double getClosePrice() {
        return closePrice;
    }

    public void setClosePrice(double closePrice) {
        this.closePrice = closePrice;
    }


}

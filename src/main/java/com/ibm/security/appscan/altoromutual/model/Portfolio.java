package com.ibm.security.appscan.altoromutual.model;

public class Portfolio {

    private int stockId;
    private long accountId;
    private String symbol;
    private int amount;
    private double price;
    private double value;

    public Portfolio(int stockId, long accountId, String symbol, int amount, double price) {
        this.accountId = accountId;
        this.amount = amount;
        this.symbol = symbol;
        this.stockId = stockId;
        this.price = price;
        this.value = price*(double)amount;
    }

    public int getStockId() {
        return stockId;
    }

    public long getAccountId() {
        return accountId;
    }

    public int getAmount() {return amount;}

    public String getSymbol(){return symbol;}

    public Double getPrice(){return price;}

    public double getValue() { return value; }

    public void setAmount(int amount){
        this.amount = amount;
    }

    public void setPrice(double price){
        this.price = price;
    }

    public void setValue(double value){
        this.value = value;
    }



}

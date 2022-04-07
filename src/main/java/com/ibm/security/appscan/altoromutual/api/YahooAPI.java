package com.ibm.security.appscan.altoromutual.api;

import yahoofinance.Stock;
import yahoofinance.YahooFinance;
import yahoofinance.histquotes.HistoricalQuote;
import yahoofinance.histquotes.Interval;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public class YahooAPI {
    public List<HistoricalQuote> getHistory(String stockName, int year) throws IOException {
        Calendar from = Calendar.getInstance();
        Calendar to = Calendar.getInstance();
        from.add(Calendar.YEAR, Integer.parseInt("-"+year));

        Stock stock = YahooFinance.get(stockName);

        List<HistoricalQuote> history = stock.getHistory(from,to, Interval.DAILY);
        return history;
    }
    public Timestamp convertDATE(Calendar cal){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(cal.getTime());
        Timestamp timestamp = Timestamp.valueOf(time);
        return timestamp;
    }
}

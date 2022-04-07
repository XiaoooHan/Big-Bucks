package com.ibm.security.appscan.altoromutual.api;

import com.ibm.security.appscan.altoromutual.model.Account;
import com.ibm.security.appscan.altoromutual.model.Portfolio;
import com.ibm.security.appscan.altoromutual.model.Trading;
import com.ibm.security.appscan.altoromutual.util.DBUtil;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;
import yahoofinance.histquotes.HistoricalQuote;
import yahoofinance.histquotes.Interval;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

    public List<HistoricalQuote> getHistory(String stockName, Calendar from) throws IOException {
        Stock stock = YahooFinance.get(stockName);

        List<HistoricalQuote> history = stock.getHistory(from,Interval.DAILY);
        return history;
    }

    public Timestamp convertDATE(Calendar cal){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(cal.getTime());
        Timestamp timestamp = Timestamp.valueOf(time);
        return timestamp;
    }

    public double calSP(Account[] accounts) throws SQLException, IOException {
        Portfolio[] portfolios = DBUtil.getPortfolio(accounts);
        Trading[] tradings = DBUtil.getTradings(accounts);

        double nowValue = 0.0;
        double lastValue = 0.0;
        for (Portfolio portfolio: portfolios){
            nowValue += YahooFinance.get(portfolio.getSymbol()).getQuote().getPrice().doubleValue() * portfolio.getAmount();
            lastValue += portfolio.getValue();
        }
        double ror = (nowValue - lastValue)/lastValue - 0.02067;

        Date firstTrade = tradings[0].getDate();

        Calendar from=Calendar.getInstance();
        from.setTime(firstTrade);

        String symbol = portfolios[1].getSymbol();
        List<HistoricalQuote> history = getHistory(symbol,from);

        List<Double> dailyRor = new ArrayList<>();
        for (HistoricalQuote quote : history) {
            double open = quote.getOpen().doubleValue();
            double adj = quote.getAdjClose().doubleValue();
            dailyRor.add((adj-open)/open);
        }

        double avgRor = 0.0;
        double sigma = 0.0;
        for (int i = 0; i < dailyRor.size(); i++) {
            avgRor += dailyRor.get(i);
        }
        avgRor = avgRor/ dailyRor.size();

        for (int i = 0; i < dailyRor.size(); i++) {
            sigma += Math.pow((dailyRor.get(i)-avgRor),2);
        }

        sigma =Math.sqrt(sigma/dailyRor.size());
        double sr = 0.0;
        sr = ror/sigma/8;

        return sr;

    }
}

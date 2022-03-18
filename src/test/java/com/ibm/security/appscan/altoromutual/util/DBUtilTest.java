package com.ibm.security.appscan.altoromutual.util;

import org.junit.jupiter.api.Test;

import java.sql.SQLException;


import static com.ibm.security.appscan.altoromutual.util.DBUtil.isDuplicateID;
import static com.ibm.security.appscan.altoromutual.util.DBUtil.signUp;
import static org.junit.jupiter.api.Assertions.assertEquals;


class DBUtilTest {

    @Test
    void isDuplicateID_test() throws SQLException {
        boolean expect1 = true;
        String name = "christinax"; //name already saved inside the data set
        boolean test = isDuplicateID(name);

        assertEquals(expect1, test);
    }

    @Test
    void noDuplicateID_test() throws SQLException {
        boolean expect2 = false;
        String name = "changs"; //name not in the data set
        boolean test = isDuplicateID(name);

        assertEquals(expect2, test);
    }

    @Test
    void signUp_test() throws SQLException{
        String un = "AB";
        String pw= "1234";
        String fn = "abc";
        String ln = "ABC";
        String test = signUp(un, pw, fn, ln);
        assertEquals(null, test);
    }

}
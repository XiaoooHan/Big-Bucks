package com.ibm.security.appscan.altoromutual.util;

import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static com.ibm.security.appscan.altoromutual.util.DBUtil.isDuplicateID;
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
    void signUp() {
    }
}
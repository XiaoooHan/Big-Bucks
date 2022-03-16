package com.ibm.security.appscan.altoromutual.api;

import com.ibm.security.appscan.altoromutual.util.DBUtil;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.sql.SQLException;

@Path("/SignUp")
public class SignUpAPI extends AltoroAPI{

    @POST
    @PermitAll
    public Response addUser(String bodyJSON, @Context HttpServletRequest request) throws IOException, SQLException {
        JSONObject bodyJson= new JSONObject();

        //Checking if user is logged in

        String username;
        String password1;
        String password2;
        String firstN;
        String lastN;

        //Convert request to JSON
        try {
            bodyJson =new JSONObject(bodyJSON);
            //Parse the request for the required parameters
            username = bodyJson.get("username").toString();
            password1 = bodyJson.get("password1").toString();
            password2 = bodyJson.get("password2").toString();
            firstN = bodyJson.get("firstN").toString();
            lastN = bodyJson.get("lastN").toString();

        } catch (JSONException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity("{\"Error\": \"Request is not in JSON format\"}").build();
        }

        if (username == null || username.trim().length() == 0
                || password1 == null || password1.trim().length() == 0
                || password2 == null || password2.trim().length() == 0)
            return Response.status(Response.Status.BAD_REQUEST).entity("{\"error\":\"An error has occurred. Please try again later.\"}").build();

        if (!password1.equals(password2)){
            return Response.status(Response.Status.BAD_REQUEST).entity("{\"error\":\"Entered passwords did not match.\"}").build();
        }

        String error = DBUtil.signUp(username, password1,firstN,lastN);

        if (error != null )
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("{\"error\":\""+error+"\"}").build();


        return Response.status(Response.Status.OK).entity("{\"success\":\"Requested operation has completed successfully.\"}").type(MediaType.APPLICATION_JSON_TYPE).build();
    }

}


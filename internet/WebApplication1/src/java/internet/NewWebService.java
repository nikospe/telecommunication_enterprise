/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package internet;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


/**
 *
 * @author
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "insertC")//insert Customer
    public String insertC(@WebParam(name = "name") String name, @WebParam(name = "surname") String surname, @WebParam(name = "birthyear") String birthyear, @WebParam(name = "gender") String gender, @WebParam(name = "homeAddr") String homeAddr,@WebParam(name = "workAddr") String workAddr, @WebParam(name = "familyState") String familyState, @WebParam(name = "afm") String afm, @WebParam(name = "bankAccount") String bankAccount, @WebParam(name = "family") String family, @WebParam(name = "beneficiary1") String beneficiary1, @WebParam(name = "beneficiary2") String beneficiary2, @WebParam(name = "customerCode") String customerCode, @WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
          InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
                
           String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return "Error SQL";
          }
          
          statement = connection.prepareStatement("INSERT INTO `User`(`name`, `surname`, `birthyear`, `gender`, `homeAddr`, `workAddr`, `familyState`, `afm`, `bankAcc`, `connection`, `beneficiary1`, `beneficiary2`, `customerCode`, `username`, `password`) VALUES ('"+name+"','"+surname+"','"+birthyear+"','"+gender+"','"+homeAddr+"','"+workAddr+"','"+familyState+"','"+afm+"','"+bankAccount+"','"+family+"','"+beneficiary1+"','"+beneficiary2+"','"+customerCode+"','"+username+"','"+password+"')");
          statement.executeUpdate();
          connection.close();
          
        } catch (Exception ex) {
            return "Η καταχώρηση απέτυχε\n"+ex;
        }
        return "Η καταχώρηση έγινε με επιτυχία!";
    }
    
    /**
     * Web service operation
     */
    @WebMethod(operationName = "insertS")//insert Customer
    public String insertS(@WebParam(name = "name") String name, @WebParam(name = "surname") String surname, @WebParam(name = "address") String address, @WebParam(name = "email") String email) {
        try {
          InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
           String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return "Error SQL";
          }
          
          statement = connection.prepareStatement("INSERT INTO `Social`(`name`, `surname`, `address`, `email`) VALUES ('"+name+"','"+surname+"','"+address+"','"+email+"')");
          statement.executeUpdate();
          connection.close();
          
        } catch (Exception ex) {
            return ex+"";
        }
        return "Η καταχώρηση έγινε με επιτυχία!";
    }
    
    /**
     * Web service operation
     */
    @WebMethod(operationName = "logoutC")//logout Customer
    public String logoutC(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
          InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return "Error SQL";
          }
          
          statement = connection.prepareStatement("select * from User where username='"+username+"' and password='"+password+"'");
          connection.close();
        } catch (Exception ex) {
            return ex+"";
        }
        return "Η αποσύνδεση έγινε με επιτυχία!";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "loginC")
    public String loginC(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          
          statement = connection.prepareStatement("select * from User where username='"+username+"' and password='"+password+"'");
          rs = statement.executeQuery();
          String rslt=new String();
          while(rs.next())
          {
              rslt+="<table border='1'><tr><td>"+rs.getString("surname")+"</td></tr><tr><td>"+rs.getString("name")+"</td></tr><tr><td>"+rs.getString("birthyear")+"</td></tr><tr><td>"+rs.getString("gender")+"</td></tr><tr><td>"+rs.getString("homeAddr")+"</td></tr><tr><td>"+rs.getString("workAddr")+"</td></tr><tr><td>"+rs.getString("familyState")+"</td></tr><tr><td>"+rs.getString("afm")+"</td></tr><tr><td>"+rs.getString("bankAcc")+"</td></tr><tr><td>"+rs.getString("connection")+"</td></tr><tr><td>"+rs.getString("beneficiary1")+"</td></tr><tr><td>"+rs.getString("beneficiary2")+"</td></tr></table>";
          }
          rs.close();
          connection.close();
          return rslt;
        } catch (Exception ex) {
            return ex+"";
        }     
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "bankAccount")
    public String bankAccount(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
         try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          
          statement = connection.prepareStatement("select * from User where username='"+username+"' and password='"+password+"'");
          rs = statement.executeQuery();
          String rslt=new String();
          while(rs.next())
          {
              rslt+=rs.getString("bankAcc");
          }
          rs.close();
          connection.close();
          return rslt;
        } catch (Exception ex) {
            return ex+"";
        }     
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "activeAcc")
    public String activeAcc(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          
          statement = connection.prepareStatement("select * from User where username='"+username+"' and password='"+password+"'");
          rs = statement.executeQuery();
          String rslt=new String();
          while(rs.next())
          {
              rslt+=rs.getString("activeAcc");
          }
          rs.close();
          connection.close();
          return rslt;
        } catch (Exception ex) {
            return ex+"";
    }
    }

    /**
     * Web service operation
     * @param bankAcc
     * @param activeAcc
     * @param accPhoneNum
     * @return 
     */
    @WebMethod(operationName = "insertNum")
    public String insertNum(@WebParam(name = "bankAcc") String bankAcc, @WebParam(name = "activeAcc") String activeAcc, @WebParam(name = "accPhoneNum") String accPhoneNum) {
        try {
          InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
           String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return "SQL";
          }
          String customerCode=null;
          statement = connection.prepareStatement("select * from User where bankAcc='"+bankAcc+"'");
          rs=statement.executeQuery();
          while(rs.next())
          {
              customerCode=rs.getString("customerCode");
          }
          statement = connection.prepareStatement("INSERT INTO `Acount`(`bankAcc`, `accNumber`, `accPhoneNum`, `customerCode`) VALUES ('"+bankAcc+"','"+activeAcc+"','"+accPhoneNum+"','"+customerCode+"')");
          statement.executeUpdate();
          int status;
          status=statement.executeUpdate("Update User set activeAcc='"+activeAcc+"' WHERE customerCode='"+customerCode+"'");
          if(status!=1)
          {
              throw new Exception();
          }
          connection.close();
          
        } catch (Exception ex) {
            return ex+"";
        }
        return "Η καταχώρηση έγινε με επιτυχία!";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "remain")
    public String remain(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          
          statement = connection.prepareStatement("select * from User where username='"+username+"' and password='"+password+"' ");
          rs = statement.executeQuery();
          String rslt=new String();
          while(rs.next())
          {
              rslt+=rs.getString("bankAcc");
          }
          rs.close();
          
          statement = connection.prepareStatement("select * from Acount where bankAcc='"+rslt+"' ");
          rs = statement.executeQuery();
          rslt="<table border=\"1\"><tr><td>Αριθμός</td><td>Υπόλοιπο</td></tr>";
          while(rs.next())
          {
              rslt+="<tr><td>&nbsp;"+rs.getString("accPhoneNum")+"&nbsp;</td><td>&nbsp;"+rs.getString("remainder")+"&nbsp;&euro;&nbsp;</td></tr>";
          }
          rslt+="</table>";
          rs.close();
          connection.close();
          return rslt;
        } catch (Exception ex) {
            return ex+"";
    }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "waitingApp")
    public String waitingApp(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
       try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          String customerCode=null;
          statement = connection.prepareStatement("select * from User where username='"+username+"'");
          rs=statement.executeQuery();
          while(rs.next())
          {
              customerCode=rs.getString("customerCode");
          }
          int status;
          status=statement.executeUpdate("Update User set waitingApp=\""+password+"\" WHERE customerCode='"+customerCode+"'");
          if(status!=1)
          {
              throw new Exception();
          }
          connection.close();
        
        } catch (Exception ex) {
            return ex+"";
        }
        return "OK";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "reload")
    public String reload(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          
          statement = connection.prepareStatement("select * from User where username='"+username+"' and password='"+password+"' ");
          rs = statement.executeQuery();
          String rslt=new String();
          while(rs.next())
          {
              rslt+=rs.getString("bankAcc");
          }
          statement = connection.prepareStatement("select * from Acount where bankAcc='"+rslt+"' ");
          rs = statement.executeQuery();
          rslt="<table border=\"0\"><tr><td>Αριθμός</td><td>Υπόλοιπο(σε &euro;)</td><td>Ποσό ανανέωσης</td></tr>";
          while(rs.next())
          {
              rslt+="<form action=\"checkReload.jsp\" method=\"post\"><tr><td><input type='text' name='accPhoneNum' value='"+rs.getString("accPhoneNum")+"' readonly></td><td>&nbsp;<input type='text' name='curRem' value='"+rs.getString("remainder")+"' readonly></td><td>&nbsp;<input type='text' name='sum'></td><td><input type='submit' value='Ανανέωση'></td></tr></form>";
          }
          rslt+="</table>";
          rs.close();
          return rslt;
        } catch (Exception ex) {
            return ex+"";
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "checkreload")
    public String checkreload(@WebParam(name = "accPhoneNum") String accPhoneNum, @WebParam(name = "sum") String sum, @WebParam(name = "curRem") String curRem ) {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            Statement statement= null;
            statement = connection.createStatement();
            int sum2=Integer.parseInt(sum)+Integer.parseInt(curRem);
            String sum3=Integer.toString(sum2);
          if (connection == null)
          {
              return null;
          }
          int status;
          status=statement.executeUpdate("Update Acount set remainder='"+sum3+"' WHERE accPhoneNum='"+accPhoneNum+"'");
          if(status!=1)
          {
              throw new Exception();
          }
          connection.close();
        
        } catch (Exception ex) {
            return ex+"";
        }
        return "Η ανανέωση ολοκληρώθηκε με επιτυχία";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "fam")
    public String fam() {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          
          statement = connection.prepareStatement("select * from User");
          rs = statement.executeQuery();
          String rslt="<select name=\"family\">";
          rslt+="<option value=\"\">(κανένας)</option>";
          while(rs.next())
          {
            rslt+="<option value=\""+rs.getString("name")+" "+rs.getString("surname")+"\">"+rs.getString("name")+" "+rs.getString("surname")+"</option>";
          }
          rslt+="</select>";
          rs.close();
          return rslt;
        } catch (Exception ex) {
            return ex+"";
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getWaiting")
    public String getWaiting(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        try {
            
           InitialContext ctx = new InitialContext();
          //The JDBC Data source that we just created
          
          String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
            Connection connection = null;         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            PreparedStatement statement= null;
            ResultSet rs= null;

          if (connection == null)
          {
              return null;
          }
          String waitingApp=null;
          statement = connection.prepareStatement("select * from User where username='"+username+"'");
          rs=statement.executeQuery();
          while(rs.next())
          {
              waitingApp=rs.getString("waitingApp");
          }
          connection.close();
          return waitingApp;
        
        } catch (Exception ex) {
            return ex+"";
        }
    }
    
      
}
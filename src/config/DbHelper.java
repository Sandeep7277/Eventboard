package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbHelper {
    public static Connection connect() throws Exception {
        final String DBNAME="eventboard";
        final  String URL="jdbc:mysql://localhost/"+DBNAME;
        final  String USER="root";
        final  String PWD="sandeep";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(URL, USER, PWD);
        return con;
    }
    
    public static List<Map<String,String>> allrecords(String table) throws Exception {
        Connection con=connect();
        ResultSet rs=con.createStatement().executeQuery("SELECT * FROM "+table);
        List<Map<String,String>> list=new ArrayList<>();
        ResultSetMetaData rsm=rs.getMetaData();
        while(rs.next()){            
            Map<String,String> map=new HashMap<>();
            for(int i=1;i<=rsm.getColumnCount();i++){
                String colname=rsm.getColumnLabel(i);
                map.put(colname,rs.getString(colname));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static List<Map<String,String>> findrecords(String table,String condition) throws Exception {
        Connection con=connect();
        ResultSet rs=con.createStatement().executeQuery("SELECT * FROM "+table+ " WHERE "+condition);
        List<Map<String,String>> list=new ArrayList<>();
        ResultSetMetaData rsm=rs.getMetaData();
        while(rs.next()){            
            Map<String,String> map=new HashMap<>();
            for(int i=1;i<=rsm.getColumnCount();i++){
                String colname=rsm.getColumnLabel(i);
                map.put(colname,rs.getString(colname));
            }
            list.add(map);
        }
        con.close();
        return list;
    }
    
    public static int count(String table) throws Exception {
        Connection con=connect();
        ResultSet rs=con.createStatement().executeQuery("SELECT count(*) FROM "+table);
        rs.next();
        int cnt=rs.getInt(1);
        con.close();
        return cnt;
    }
    
    public static String getDate(String date) {                        
        DateTimeFormatter newPattern = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
        LocalDate ldate=LocalDate.parse(date);        
        return ldate.format(newPattern);
    }
}

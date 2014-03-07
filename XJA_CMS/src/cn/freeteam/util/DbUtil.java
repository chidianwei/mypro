package cn.freeteam.util;

/** 
*DBUtil.java 
*连接数据库 
*/  
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
public class DbUtil {  
    private String driver;//定义驱动  
    private String url;//定义URL  
    private String user;//定义用户名  
    private String password;//定义密码  
    private Connection conn;//定义连接  
    private Statement stmt;//定义STMT  
    private ResultSet rs;//定义结果集  
    //构造函数，默认加裁配置文件为jdbc.driver  
    public DbUtil(){  
        this("db_ext.properties");  
    }  
    //有参构造函数，传入路径Conf并用方法loadProperties进行加载，用setConn进行设置  
    public DbUtil(String conf) {  
        try {
			loadProperties(conf);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
        setConn();  
    }  
    //返回Conn  
    public Connection getConn(){  
        return this.conn;  
    }  
  //传入参数路径Conf加载配置文件取得配置文件中的参数并设置为类变量的参数  
    private void loadProperties(String conf) throws Exception{  
        Properties props = new Properties();  
        try {  
        	String urlstr=DbUtil.class.getClassLoader().getResource("")+"/"+conf;
        	System.out.println(urlstr+"=======================");
        	URL url = new URL(urlstr) ;
        	File file = new File(url.toURI());
            props.load(new FileInputStream(file));//根据配置文件路径Conf加载配置文件  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        this.driver = props.getProperty("driver");//从配置文件中取得相应的参数并设置类变量  
        this.url = props.getProperty("url");  
        this.user = props.getProperty("username");  
        this.password = props.getProperty("password");  
    }  
    //implement the Connection  
    //设置CONN  
    private void setConn(){  
        try {  
            Class.forName(driver);  
            this.conn = DriverManager.getConnection(url,user,password);  
        } catch(ClassNotFoundException classnotfoundexception) {  
              classnotfoundexception.printStackTrace();  
            System.err.println("db: " + classnotfoundexception.getMessage());  
        } catch(SQLException sqlexception) {  
            System.err.println("db.getconn(): " + sqlexception.getMessage());  
        }  
    }  
    //执行插入  
       public void doInsert(String sql) {  
        try {  
            Statement statement = conn.createStatement();  
            int i = stmt.executeUpdate(sql); 
        } catch(SQLException sqlexception) {  
            System.err.println("db.executeInset:" + sqlexception.getMessage());  
        }finally{  
              
        }  
    }  
    //执行删除  
    public void doDelete(String sql) {  
        try {  
            stmt = conn.createStatement();  
            int i = stmt.executeUpdate(sql);  
        } catch(SQLException sqlexception) {  
            System.err.println("db.executeDelete:" + sqlexception.getMessage());  
        }  
    }  
    //执行更新  53372212
    public void doUpdate(String sql) {  
        try {  
            stmt = conn.createStatement();  
            int i = stmt.executeUpdate(sql);  
        } catch(SQLException sqlexception) {  
            System.err.println("db.executeUpdate:" + sqlexception.getMessage());  
        }  
    }  
    //查询结果集  
    public ResultSet doSelect(String sql) {  
        try {  
            stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);  
            rs = stmt.executeQuery(sql);  
        } catch(SQLException sqlexception) {  
            System.err.println("db.executeQuery: " + sqlexception.getMessage());  
        }  
        return rs;  
    }  
    /** 
     *关闭数据库结果集，数据库操作对象，数据库链接 
       @Function: Close all the statement and conn int this instance and close the parameter ResultSet 
       @Param: ResultSet 
       @Exception: SQLException,Exception 
      **/  
     public void close(ResultSet rs) throws SQLException, Exception {  
  
       if (rs != null) {  
         rs.close();  
         rs = null;  
       }  
  
       if (stmt != null) {  
         stmt.close();  
         stmt = null;  
       }  
  
       if (conn != null) {  
         conn.close();  
         conn = null;  
       }  
     }  
  
     /** 
      *关闭数据库操作对象，数据库连接对象 
      * Close all the statement and conn int this instance 
      * @throws SQLException 
      * @throws Exception 
      */  
     public void close() throws SQLException, Exception {  
       if (stmt != null) {  
         stmt.close();  
         stmt = null;  
       }  
  
       if (conn != null) {  
         conn.close();  
         conn = null;  
       }  
     } 
     
     public List<Map<String,Object>> getListBySql(String sql) throws Exception
     {
    	 List <Map<String,Object>> lst=new ArrayList<Map<String,Object>>();
    	 ResultSet rs=this.doSelect(sql);
    	 ResultSetMetaData md = rs.getMetaData();
 		 int columnCount = md.getColumnCount();
    	 if(rs!=null)
    	 {
    		 Map<String,Object> rowData;
    			while (rs.next()) {
    				rowData = new HashMap<String,Object>(columnCount);
    				for (int i = 1; i <= columnCount; i++) {
    					rowData.put(md.getColumnName(i).toLowerCase(), rs.getObject(i));
    				}
    				lst.add(rowData);
    			}
    	 }
    	 return lst;
     }
     //resultset转list
	public List resultSetToList(ResultSet rs) throws java.sql.SQLException {
		if (rs == null)
			return Collections.EMPTY_LIST;
		ResultSetMetaData md = rs.getMetaData();
		int columnCount = md.getColumnCount();
		List list = new ArrayList();
		Map rowData;
		while (rs.next()) {
			rowData = new HashMap(columnCount);
			for (int i = 1; i <= columnCount; i++) {
				rowData.put(md.getColumnName(i), rs.getObject(i));
			}
			list.add(rowData);
			System.out.println("list: " + list.toString());
		}
		return list;
	}
     
     
    //测试类  
    public static void main(String[] args){  
        try{  
            //根据传入配置路径构造类  
            DbUtil db = new DbUtil("src\\db_ext.properties");  
//            db.loadProperties("src\\com\\struts\\properties\\jdbc.properties");  
//            System.out.print(db.driver);  
            //取得连接  
            Connection conn = db.getConn();  
            if(conn != null && !conn.isClosed()) {  
                System.out.println("連結成功");  
                ResultSet rs = db.doSelect("select * from freecms_users");  
                while(rs.next()){  
                    System.out.println(rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3));  
                  }  
                rs.close();  
                conn.close();  
            }  
        }catch(SQLException e) {  
            e.printStackTrace();  
        }  
    }    
}  
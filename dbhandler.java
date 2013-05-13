import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;
import java.sql.*;


public class dbhandler extends BaseClientRequestHandler {
	String table=null, json="", name, score;
	@Override
	public void handleClientRequest(User arg0, ISFSObject arg1) {
		Connection con=null;
		ResultSet rs=null;
		table=arg1.getUtfString("level");
		name=arg1.getUtfString("name");
		score=arg1.getUtfString("score");
		
		
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost/pupai","root","");
			ISFSObject respuesta = SFSObject.newInstance();
			Statement stat=con.createStatement();
			if(name!=null){
				stat.execute("insert into "+table+" (name, score) values ('"+name+"',"+score+")");
				System.out.println("insert into "+table+" (name, score) values ('"+name+"',"+score+")");
			}
			PreparedStatement statement = con.prepareStatement("Select name, score from "+table+" order by score asc limit 5");
			rs=statement.executeQuery();
			while(rs.next()){
				json+=rs.getString(1);
				json+=" "+rs.getInt(2)+"\n";
		
			}
			respuesta.putUtfString("json", json);
			
			send("dbsolicitud", respuesta, arg0);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
       
		
	}

	

}
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.BuscarSOsException;
import model.SistemaOperacinal;

public class SistemaOperacionalDAO {

private ConnectionFactory con;
	
	public SistemaOperacionalDAO() throws SQLException{
		super();
		setCon(new ConnectionFactory());
		getCon().conectar("af");
	}

	public ArrayList<SistemaOperacinal> buscar() throws SQLException, BuscarSOsException{
		ArrayList<SistemaOperacinal> SOs = new ArrayList<SistemaOperacinal>();
		try {
			String query = "select * from software";
			PreparedStatement stmt= (PreparedStatement) getCon().getConnection().prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getBoolean("SO"));
				if(rs.getBoolean("SO")) {
					SistemaOperacinal SO = new SistemaOperacinal();
					SO.setNome(rs.getString("nome"));
					SOs.add(SO);
				}
			}
			rs.close();
			stmt.close();
		}catch (Exception e) {
			throw new BuscarSOsException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
		return SOs;
	}
	
	public ConnectionFactory getCon() {
		return con;
	}

	public void setCon(ConnectionFactory con) {
		this.con = con;
	}
}

package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import control.SistemaOperacinalBean;
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
	
	public ArrayList<SistemaOperacinalBean> buscar2(SistemaOperacinalBean soDAO) throws SQLException, BuscarSOsException{
		ArrayList<SistemaOperacinalBean> SOs = new ArrayList<SistemaOperacinalBean>();
		try {
			String query2 = "select * from so where idMaquina="+soDAO.getIdMaquina();
			PreparedStatement stmt= (PreparedStatement) getCon().getConnection().prepareStatement(query2);
			ResultSet rs2 = stmt.executeQuery();
			while(rs2.next()) {
				SistemaOperacinalBean SO = new SistemaOperacinalBean();
				SO.setNome(rs2.getString("nome"));
				SO.setIdMaquina(soDAO.getIdMaquina());
				SOs.add(SO);
			}
			rs2.close();
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

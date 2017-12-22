package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import control.MaquinaBean;
import model.BuscarSOsException;
import model.ErroMaquinaException;
import model.Maquina;
import model.SistemaOperacinal;

public class MaquinaDAO {

	private ConnectionFactory con;
	
	public MaquinaDAO() throws SQLException {
		super();
		setCon(new ConnectionFactory());
		getCon().conectar("af");
	}
	
	public void cadastrar(MaquinaBean maquina) throws SQLException, ErroMaquinaException {
		try {
			String query = "insert into maquina (idMaquina,processador,memoriaram,memoriacache) values (?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setInt(1, maquina.getIdMaquina());
			stmt.setString(2, maquina.getProcessador());
			stmt.setString(3, maquina.getRam());
			stmt.setString(4, maquina.getCache());
			stmt.executeUpdate();
			query="insert into so(idMaquina,nome) values(?,?)";
			stmt=(PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setInt(1, maquina.getIdMaquina());
			stmt.setString(2, maquina.getNomeSO());
			stmt.executeUpdate();
			stmt.close();
		}catch (Exception e) {
			throw new ErroMaquinaException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
	}
	
	public ArrayList<MaquinaBean> buscar() throws SQLException, BuscarSOsException{
		ArrayList<MaquinaBean> maquinas = new ArrayList<MaquinaBean>();
		try {
			String query = "select * from maquina";
			PreparedStatement stmt= (PreparedStatement) getCon().getConnection().prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			ResultSet rs2;
			while(rs.next()) {
				MaquinaBean maquina = new MaquinaBean();
				String so;
				maquina.setIdMaquina(rs.getInt("idMaquina"));
				query = "select * from so where idMaquina="+rs.getInt("idMaquina");
				stmt=(PreparedStatement) getCon().getConnection().prepareStatement(query);
				rs2=stmt.executeQuery();
				rs2.next();
				so=rs2.getString("nome");
				while(rs2.next()) {
					so=so+","+rs2.getString("nome");
				}
				maquina.setNomeSO(so);
				maquina.setProcessador(rs.getString("processador"));
				maquina.setRam(rs.getString("memoriaram"));
				maquina.setCache(rs.getString("memoriacache"));
				maquinas.add(maquina);
			}
			rs.close();
			stmt.close();
		}catch (Exception e) {
			e.printStackTrace();
			throw new BuscarSOsException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
		return maquinas;
	}

	public ConnectionFactory getCon() {
		return con;
	}

	public void setCon(ConnectionFactory con) {
		this.con = con;
	}
}

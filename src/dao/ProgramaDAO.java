package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import control.MaquinaBean;
import control.ProgramaBean;

public class ProgramaDAO {

	private ConnectionFactory con;
	
	public ProgramaDAO() throws SQLException {
		super();
		setCon(new ConnectionFactory());
		getCon().conectar("af");
	}
	
	public void cadastrar(ProgramaBean proB) throws ErroProgramaException, SQLException {
		try {
			String query = "insert into software (nome,livre,SO,nomeSO,dataLicenca,licencaID) values (?,?,?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setString(1, proB.getNome());
			stmt.setBoolean(2, proB.isLivre());
			stmt.setBoolean(3, proB.isSO());
			stmt.setString(4, proB.getNomeSO());
			stmt.setDate(5, new Date(new SimpleDateFormat("yyyy-MM-dd").parse(proB.getData()).getTime()));
			stmt.setString(6,proB.getLicencaID());
			stmt.executeUpdate();
			stmt.close();
		}catch (Exception e) {
			throw new ErroProgramaException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
	}
	
	public void cadastrar2(ProgramaBean proB) throws ErroProgramaException, SQLException {
		try {
			String query = "insert into software (nome,livre,SO,nomeSO) values (?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setString(1, proB.getNome());
			stmt.setBoolean(2, proB.isLivre());
			stmt.setBoolean(3, proB.isSO());
			stmt.setString(4, proB.getNomeSO());
			stmt.executeUpdate();
			stmt.close();
		}catch (Exception e) {
			throw new ErroProgramaException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
	}
	
	public ArrayList<ProgramaBean> buscar() throws ErroProgramaException, SQLException{
		ArrayList<ProgramaBean> proBs=new ArrayList<ProgramaBean>();
		try {
			String query = "select * from software";
			PreparedStatement stmt= (PreparedStatement) getCon().getConnection().prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				ProgramaBean pro = new ProgramaBean();
				pro.setNome(rs.getString("nome"));
				pro.setLivre(rs.getBoolean("livre"));
				pro.setSO(rs.getBoolean("SO"));
				pro.setNomeSO(rs.getString("nomeSO"));
				pro.setData(rs.getString("dataLicenca"));
				pro.setLicencaID(rs.getString("licencaId"));
				proBs.add(pro);
			}
			rs.close();
			stmt.close();
		}catch (Exception e) {
			throw new ErroProgramaException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
		return proBs;
	}
	
	public void adicionar(ProgramaBean proB) throws ErroProgramaException, SQLException {
		try {
			String query = "update software set idMaquina = ?, nomeSO=? where nomeSO is null and nome=? and idMaquina is null";
			PreparedStatement stmt= (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setInt(1, proB.getIdMaquina());
			stmt.setString(2, proB.getNomeSO());
			stmt.setString(3, proB.getNome());
			stmt.executeUpdate();
		}catch (Exception e) {
			throw new ErroProgramaException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
	}

	public ConnectionFactory getCon() {
		return con;
	}

	public void setCon(ConnectionFactory con) {
		this.con = con;
	}
}

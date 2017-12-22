package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.mysql.jdbc.PreparedStatement;

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
			String query = "insert into software (nome,livre,SO,dataLicenca,licencaID) values (?,?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setString(1, proB.getNome());
			stmt.setBoolean(2, proB.isLivre());
			stmt.setBoolean(3, proB.isSO());
			stmt.setDate(4, new Date(new SimpleDateFormat("yyyy-MM-dd").parse(proB.getData()).getTime()));
			stmt.setString(5,proB.getLicencaID());
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
			String query = "insert into software (nome,livre,SO) values (?,?,?)";
			PreparedStatement stmt = (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setString(1, proB.getNome());
			stmt.setBoolean(2, proB.isLivre());
			stmt.setBoolean(3, proB.isSO());
			stmt.executeUpdate();
			stmt.close();
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

package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import control.UsuarioBean;
import model.CadastroUsuarioException;
import model.ErroLoginException;

public class UsuarioDAO {
	private ConnectionFactory con;
	
	public UsuarioDAO() throws SQLException {
		setCon(new ConnectionFactory());
		getCon().conectar("af");
	}
	
	public UsuarioBean buscar(String usuario) throws SQLException, ErroLoginException{
		UsuarioBean user=new UsuarioBean();
		try {
			String query = "select * from usuario where usuario= ?";
			PreparedStatement stmt= (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setString(1, usuario);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			user.setUsuario(rs.getString("usuario"));
			user.setSenha(rs.getString("senha"));
			rs.close();
			stmt.close();
		}catch(SQLException e) {
			throw new ErroLoginException("usuario ou senha invalido");
		}finally {
			getCon().getConnection().close();
		}
		return user;
		
	}
	
	public void cadastrar(UsuarioBean userB) throws SQLException, CadastroUsuarioException {
		try {
			String query = "insert into usuario (usuario,senha) values (?,?)";
			PreparedStatement stmt = (PreparedStatement) getCon().getConnection().prepareStatement(query);
			stmt.setString(1, userB.getUsuario());
			stmt.setString(2, userB.getSenha());
			stmt.executeUpdate();
			stmt.close();
		} catch (Exception e) {
			throw new CadastroUsuarioException(e.getMessage());
		}finally {
			getCon().getConnection().close();
		}
	}

	public ConnectionFactory getCon() {return con;}
	public void setCon(ConnectionFactory connectionFactory) {this.con = connectionFactory;}
	
	
}

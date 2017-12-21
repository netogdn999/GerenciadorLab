package model;

import java.sql.SQLException;
import control.UsuarioBean;
import dao.UsuarioDAO;

public class Usuario {
	private String usuario;
	private String senha;
	
	public Usuario() {
		super();
	}
	
	public Usuario(UsuarioBean user) throws campoInvalidoException {
		this();
		povoar(user);
	}
	
	public void povoar(UsuarioBean user) throws campoInvalidoException {
		setUsuario(user.getUsuario());
		setSenha(user.getSenha());
	}
	
	public UsuarioBean logar() throws SQLException, ErroLoginException {
		UsuarioDAO userDAO=new UsuarioDAO();
		UsuarioBean userB=userDAO.buscar(getUsuario());
		if(!userB.getSenha().equals(getSenha())) {
			throw new ErroLoginException("senha ou usuario inválido");
		}
		return userB;
	}
	
	public void cadastrar() throws SQLException, CadastroUsuarioException {
		UsuarioDAO userDAO=new UsuarioDAO();
		UsuarioBean userB=new UsuarioBean();
		userB.setUsuario(getUsuario());
		userB.setSenha(getSenha());
		userDAO.cadastrar(userB);
	}
	
	public String getUsuario() {return usuario;}
	public void setUsuario(String usuario) throws campoInvalidoException {
		if(usuario.length()>0 && usuario!=null) {			
			this.usuario = usuario;
		}else {
			throw new campoInvalidoException("campo em branco");
		}
	}
	public String getSenha() {return senha;}
	public void setSenha(String senha) throws campoInvalidoException {
		if(senha.length()>0 && senha!=null) {			
			this.senha = senha;
		}else {
			throw new campoInvalidoException("campo em branco");
		}
	}
}

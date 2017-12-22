package model;

import java.sql.SQLException;
import java.util.ArrayList;

import control.SistemaOperacinalBean;
import dao.SistemaOperacionalDAO;

public class SistemaOperacinal {
	private String nome;
	private int idMaquina;
	public SistemaOperacinal() {
		super();
		
	}
	public SistemaOperacinal(SistemaOperacinalBean so) {
		this();
		addPrograma(so);
	}
	public void addPrograma(SistemaOperacinalBean so) {
		setNome(so.getNome());
		setIdMaquina(so.getIdMaquina());
	}
	
	public ArrayList<SistemaOperacinalBean> buscar() throws SQLException, BuscarSOsException{
		SistemaOperacionalDAO SODAO=new SistemaOperacionalDAO();
		SistemaOperacinalBean SOB=new SistemaOperacinalBean();
		SOB.setIdMaquina(getIdMaquina());
		return SODAO.buscar2(SOB);
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getIdMaquina() {
		return idMaquina;
	}
	public void setIdMaquina(int idMaquina) {
		this.idMaquina = idMaquina;
	}
}
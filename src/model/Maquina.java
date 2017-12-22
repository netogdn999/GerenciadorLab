package model;

import java.sql.SQLException;
import java.util.ArrayList;

import control.MaquinaBean;
import dao.MaquinaDAO;

public class Maquina {
	private int idMaquina;
	private String processador;
	private String ram;
	private String cache;
	private String nomeSO;
	
	public Maquina() {
		super();
	}
	
	public Maquina(MaquinaBean maq) {
		this();
		preencher(maq);
	}
	
	public void preencher(MaquinaBean maq) {
		setIdMaquina(maq.getIdMaquina());
		setProcessador(maq.getProcessador());
		setRam(maq.getRam());
		setCache(maq.getCache());
		setNomeSO(maq.getNomeSO());
	}
	
	public void cadastrar() throws SQLException, ErroMaquinaException {
		MaquinaBean maq=new MaquinaBean();
		maq.setIdMaquina(getIdMaquina());
		maq.setProcessador(getProcessador());
		maq.setRam(getRam());
		maq.setCache(getCache());
		maq.setNomeSO(getNomeSO());
		MaquinaDAO maqDAO=new MaquinaDAO();
		maqDAO.cadastrar(maq);
	}
	
	public ArrayList<MaquinaBean> buscar() throws SQLException, BuscarSOsException{
		MaquinaDAO maqDAO=new MaquinaDAO();
		return maqDAO.buscar();
	}
	
	public String getProcessador() {
		return processador;
	}
	public void setProcessador(String processador) {
		this.processador = processador;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getCache() {
		return cache;
	}
	public void setCache(String cache) {
		this.cache = cache;
	}
	public String getNomeSO() {
		return nomeSO;
	}
	public void setNomeSO(String nomeSO) {
		this.nomeSO = nomeSO;
	}

	public int getIdMaquina() {
		return idMaquina;
	}

	public void setIdMaquina(int idMaquina) {
		this.idMaquina = idMaquina;
	}
}

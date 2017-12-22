package model;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import control.ProgramaBean;
import dao.ErroProgramaException;
import dao.ProgramaDAO;

public class Programa {
	private boolean livre;
	private boolean SO;
	private Date data;
	private int idMaquina;
	private String nome;
	private String nomeSO;
	private String licencaID;
	public Programa() {
		super();
	}
	public Programa(ProgramaBean programa) throws ParseException {
		this();
		povoar(programa);
	}

	public void povoar(ProgramaBean programa) throws ParseException {
		if(!programa.isLivre()) {
			setData(new Date(new SimpleDateFormat("yyyy-MM-dd").parse(programa.getData()).getTime()));
			setLicencaID(programa.getLicencaID());
		}
		setLivre(programa.isLivre());
		setSO(programa.isSO());
		setNomeSO(programa.getNomeSO());
		setNome(programa.getNome());
	}
	
	public void cadastrar() throws SQLException, ErroProgramaException{
		ProgramaBean proB =new ProgramaBean();
		proB.setNome(getNome());
		proB.setLivre(isLivre());
		proB.setSO(isSO());
		proB.setNomeSO(getNomeSO());
		ProgramaDAO proDAO=new ProgramaDAO();
		if(!proB.isLivre()) {
			proB.setData(""+getData());
			proB.setLicencaID(getLicencaID());
			proDAO.cadastrar(proB);
		}else
			proDAO.cadastrar2(proB);
	}
	
	public void adicionar() throws SQLException, ErroProgramaException {
		ProgramaBean proB=new ProgramaBean();
		proB.setIdMaquina(getIdMaquina());
		proB.setNomeSO(getNomeSO());
		proB.setNome(getNome());
		ProgramaDAO proDAO=new ProgramaDAO();
		proDAO.adicionar(proB);
	}
	
	public ArrayList<ProgramaBean> buscar() throws SQLException, ErroProgramaException{
		ProgramaDAO pro=new ProgramaDAO();
		return pro.buscar();
	}
	
	public boolean isLivre() {
		return livre;
	}
	public void setLivre(boolean livre) {
		this.livre = livre;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getLicencaID() {
		return licencaID;
	}
	public void setLicencaID(String licencaID) {
		this.licencaID = licencaID;
	}
	public boolean isSO() {
		return SO;
	}
	public void setSO(boolean sO) {
		SO = sO;
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

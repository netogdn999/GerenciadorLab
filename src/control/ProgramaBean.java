package control;

public class ProgramaBean {
	private boolean livre;
	private boolean SO;
	private String data;
	private String nome;
	private int idMaquina;
	private String nomeSO;
	private String licencaID;
	public ProgramaBean() {
		super();
	}
	public boolean isLivre() {
		return livre;
	}
	public void setLivre(boolean livre) {
		this.livre = livre;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
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

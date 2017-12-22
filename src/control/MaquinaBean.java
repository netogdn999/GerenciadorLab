package control;

public class MaquinaBean {
	private int idMaquina;
	private String processador;
	private String ram;
	private String cache;
	private String nomeSO;
	
	public MaquinaBean() {
		super();
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

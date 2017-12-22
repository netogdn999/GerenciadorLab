package model;

import control.SistemaOperacinalBean;

public class SistemaOperacinal {
	private String nome;
	public SistemaOperacinal() {
		super();
		
	}
	public SistemaOperacinal(SistemaOperacinalBean so) {
		this();
		addPrograma(so);
	}
	public void addPrograma(SistemaOperacinalBean so) {
		setNome(so.getNome());
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
}

		
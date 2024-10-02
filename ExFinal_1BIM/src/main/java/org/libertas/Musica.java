package org.libertas;

public class Musica {	
	private int id;
	private String compositor, cantor, nomeMusica, anoLancamento;
	
	public Musica() {
		id = 0;
		compositor = "";
		cantor = "";
		nomeMusica = "";
		anoLancamento = "";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompositor() {
		return compositor;
	}
	public void setCompositor(String compositor) {
		this.compositor = compositor;
	}
	public String getCantor() {
		return cantor;
	}
	public void setCantor(String cantor) {
		this.cantor = cantor;
	}
	public String getNomeMusica() {
		return nomeMusica;
	}
	public void setNomeMusica(String nomeMusica) {
		this.nomeMusica = nomeMusica;
	}
	public String getAnoLancamento() {
		return anoLancamento;
	}
	public void setAnoLancamento(String anoLancamento) {
		this.anoLancamento = anoLancamento;
	}
	@Override
	public String toString() {
		return "";
	}
}

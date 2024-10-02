package org.libertas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class MusicaDao {
	private static LinkedList<Musica> lista;
	private Conexao con;
	private Statement sta;
	private PreparedStatement prep;
	
	public void criarTabela() {
		String sql = "CREATE TABLE IF NOT EXISTS musica( "
				+ "id INT PRIMARY KEY AUTO_INCREMENT, "
				+ "compositor VARCHAR(255), "
				+ "cantor VARCHAR(255), "
				+ "nomemusica VARCHAR(255), "
				+ "anolancamento CHAR(4));";
		
		try {
			con = new Conexao();
			sta = con.getCon().createStatement();
			sta.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			con.desconecta();
		}
	}
	
	public LinkedList<Musica> listar() {
		lista = new LinkedList<Musica>();
		try {
			String sql = "SELECT * FROM musica ORDER BY id";
			con = new Conexao();
			sta = con.getCon().createStatement();
			ResultSet res = sta.executeQuery(sql);
			while(res.next()) {
				Musica m = new Musica();
				m.setId(res.getInt("id"));
				m.setCompositor(res.getString("compositor"));
				m.setCantor(res.getString("cantor"));
				m.setNomeMusica(res.getString("nomemusica"));
				m.setAnoLancamento(res.getString("anolancamento"));
				lista.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			con.desconecta();
		}
		return lista;
	}
	
	public boolean inserir(Musica m) {
		try {
			String sql = "INSERT INTO musica (compositor, cantor, nomemusica, anolancamento) VALUES "
					+ "(?, ?, ?, ?);";
			
			con = new Conexao();
			prep = con.getCon().prepareStatement(sql);
			prep.setString(1, m.getCompositor());
			prep.setString(2, m.getCantor());
			prep.setString(3, m.getNomeMusica());
			prep.setString(4, m.getAnoLancamento());
			
			prep.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			con.desconecta();
		}
	}
	
	public boolean alterar(Musica m) {
		try {
			String sql = "UPDATE musica SET compositor = ?, cantor = ?, nomemusica = ?, anolancamento = ? WHERE id = ?";
			
			con = new Conexao();
			prep = con.getCon().prepareStatement(sql);
			prep.setString(1, m.getCompositor());
			prep.setString(2, m.getCantor());
			prep.setString(3, m.getNomeMusica());
			prep.setString(4, m.getAnoLancamento());
			prep.setInt(5, m.getId());
			
			prep.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			con.desconecta();
		}
	}
	
	public boolean excluir(int id) {
		try {
			String sql = "DELETE FROM musica WHERE id = ?";
			con = new Conexao();
			PreparedStatement prep = con.getCon().prepareStatement(sql);
			prep.setInt(1, id);
			prep.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			con.desconecta();
		}
	}
	
	public Musica consultar(int id) {
		Musica m = new Musica();
		try {
			String sql = "SELECT * FROM musica WHERE id = "+id+";";
			con = new Conexao();
			sta = con.getCon().createStatement();
			ResultSet res = sta.executeQuery(sql);
			if(res.next()) {
				m.setId(res.getInt("id"));
				m.setCompositor(res.getString("compositor"));
				m.setCantor(res.getString("cantor"));
				m.setNomeMusica(res.getString("nomemusica"));
				m.setAnoLancamento(res.getString("anolancamento"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			con.desconecta();
		}
		return m;
	}
	
	public boolean salvar(Musica m) {
		if(m.getId() > 0) {
			return alterar(m);
		}else {
			return inserir(m);
		}
	}
}

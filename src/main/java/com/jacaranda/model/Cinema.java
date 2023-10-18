package com.jacaranda.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="Cine")
public class Cinema {
	@Id
	@Column(name="cine")
	private String cinema;
	
	@Column(name="ciudad_cine")
	private String cinemaCity;
	
	@Column(name="direccion_cine")
	private String cinemaAdress;
	
	public Cinema(String cinema, String cinemaCity, String cinemaAdress) {
		super();
		this.cinema = cinema;
		this.cinemaCity = cinemaCity;
		this.cinemaAdress = cinemaAdress;
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getCinemaCity() {
		return cinemaCity;
	}
	public void setCinemaCity(String cinemaCity) {
		this.cinemaCity = cinemaCity;
	}
	public String getCinemaAdress() {
		return cinemaAdress;
	}
	public void setCinemaAdress(String cinemaAdress) {
		this.cinemaAdress = cinemaAdress;
	}
	public Cinema() {
		super();
	}
	@Override
	public int hashCode() {
		return Objects.hash(cinema);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cinema other = (Cinema) obj;
		return Objects.equals(cinema, other.cinema);
	}
	@Override
	public String toString() {
		return "Cine [cine=" + cinema + ", ciudadCine=" + cinemaCity + ", direccionCine=" + cinemaAdress + "]";
	}
	
	

}

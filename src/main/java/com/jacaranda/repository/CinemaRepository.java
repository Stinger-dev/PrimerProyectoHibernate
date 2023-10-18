package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;

import com.jacaranda.model.Cinema;
import com.jacaranda.util.BdUtil;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

public class CinemaRepository {

	public static Cinema mergeCine(Cinema c) {
		Transaction trans = null; 
		Session session = BdUtil.getSessionFactory().openSession();
		trans = (Transaction) session.beginTransaction();
		
		
		
		Cinema result = null;
		try {
			result = session.merge(c);
			trans.commit();
		} catch (Exception e) {
			System.out.println("ha ocurrido una excepcion en repositorio add");
			System.out.println(e);
			trans.rollback();
		}
		session.close();
		
		
		
		return result;
	}
	
	public static Cinema deleteCinema(Cinema c) {
		Transaction trans = null; 
		Session session = BdUtil.getSessionFactory().openSession();
		trans = (Transaction) session.beginTransaction();
		
		
		Cinema result = null;
		try {
			session.remove(c);
			trans.commit();
		} catch (Exception e) {
			System.out.println("ha ocurrido una excepcion en delete");

			System.out.println(e);
			trans.rollback();
		}
		session.close();
		
		
		
		
		return result;
	}
	public static List<Cinema> getCinemas(){
		Session session = BdUtil.getSessionFactory().openSession();
		List<Cinema> r = (List<Cinema>) session.createSelectionQuery("From Cinema").getResultList();
		return r;
	}
	
	public static Cinema getCinema(String cine) {
		Cinema result = null;
		Session session = BdUtil.getSessionFactory().openSession();
		SelectionQuery<Cinema> q = session.createSelectionQuery("From Cinema where cinema = :cinema",Cinema.class);
		q.setParameter("cinema", cine);
		List<Cinema> cinemas = q.getResultList();
		if(cinemas.size() != 0) result = cinemas.get(0);
		return result;	
	}

}

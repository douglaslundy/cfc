package org.autoescola.sae.models;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Agenda {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;	
	private String title;
	private String color;	
	@DateTimeFormat
	private Calendar start;
	private Calendar end;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Calendar getStart() {
		return start;
	}
	public void setStart(Calendar start) {
		this.start = start;
	}
	public Calendar getEnd() {
		return end;
	}
	public void setEnd(Calendar end) {
		this.end = end;
	}
	@Override
	public String toString() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return "{id:" + id + ", title:" +'"' +title +'"' + ", color:" +'"' + color +'"' + ", start:" +'"' + df.format(start.getTime()) +'"' + ", end:" +'"' + df.format(end.getTime())+'"' +"}";
	}
	
	
}

package poly.edu.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "Video")
public class Video implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "videoId")
	private String videoId;
	
	@Column(name = "active")
	private boolean active;
	
	@Column(name = "desciption",columnDefinition = "nvarchar(MAX) NOT NULL")
	private String description;
	
	@Column(name = "poster")
	private String poster;
	
	@Column(name = "title",columnDefinition = "nvarchar(255) NOT NULL")
	private String title;
	
	@Column(name = "views")
	private int views;
	
	//Quan hệ N - 1 với Category
	@ManyToOne
	@JoinColumn(name = "categoryId")
	private Category category;
}

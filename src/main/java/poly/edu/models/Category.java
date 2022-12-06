package poly.edu.models;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "Category")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryId")
    private Long categoryId;

    @Column(name = "categoryCode")
    private String categoryCode;

    @Column(name = "categoryName", columnDefinition = "nvarchar(255)")
    private String categoryName;

    @Column(name = "images")
    private String images;

    @Column(name = "status")
    private boolean status;

    // Quan hệ 1 - N với Video
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private Set<Video> videos;
}

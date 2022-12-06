package poly.edu.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import poly.edu.models.Category;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{
	List<Category> findByCategoryNameContaining(String name);
	Page<Category> findByCategoryNameContaining(String name, Pageable pageable);
}

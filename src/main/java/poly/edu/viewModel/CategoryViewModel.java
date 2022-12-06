package poly.edu.viewModel;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CategoryViewModel {
	private Long categoryId;
	private String categoryCode;
	
	@NotEmpty
	@Length(min = 5)
	private String categoryName;
	private String iamges;
	private MultipartFile imageFile; // lưu hình ảnh
	private boolean status;
	private Boolean isEdit = false;
}

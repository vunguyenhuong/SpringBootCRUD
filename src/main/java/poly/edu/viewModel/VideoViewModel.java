package poly.edu.viewModel;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class VideoViewModel {
	private String videoId;
	private boolean active;
	private String description;
	private MultipartFile imageFile;
	private String poster;
	private String title;
	private String views;
	private Long categoryId;
	
	private Boolean isEdit = false;
}

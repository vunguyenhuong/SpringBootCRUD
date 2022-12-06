package poly.edu.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import poly.edu.models.Category;
import poly.edu.service.ICategoryService;
import poly.edu.viewModel.CategoryViewModel;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {

    @Autowired
    ICategoryService categoryService;

    @RequestMapping("")
    public String listCategories(ModelMap model) {
        List<Category> list = categoryService.findAll();
        model.addAttribute("categories", list);
        return "admin/categories/list";
    }

    @GetMapping("add")
    public String add(ModelMap model) {
        CategoryViewModel categoryViewModel = new CategoryViewModel();
        categoryViewModel.setIsEdit(false);
        model.addAttribute("category", categoryViewModel);
        return "admin/categories/addOrEdit";
    }

    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model,
                                     @Valid @ModelAttribute("category") CategoryViewModel cate, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("admin/categories/addOrEdit");
        }
        Category category = new Category();
        // coppy từ ViewModel sang Model
        BeanUtils.copyProperties(cate, category);
        categoryService.save(category);
        String message = "";
        if (cate.getIsEdit() == true) {
            message = "Cập nhật thành công!";
        } else {
            message = "Thêm thành công!";
        }
        model.addAttribute("message", message);
        return new ModelAndView("forward:/admin/categories", model);
    }

    @GetMapping("edit/{categoryId}")
    public ModelAndView edit(ModelMap model,
                             @PathVariable("categoryId") Long categoryId) {
        Optional<Category> opt = categoryService.findById(categoryId);

        CategoryViewModel cate = new CategoryViewModel();
        if (opt.isPresent()) {
            Category category = opt.get();
            BeanUtils.copyProperties(category, cate); // coppy từ Model sang ViewModel
            cate.setIsEdit(true);
            model.addAttribute("category", cate);
            return new ModelAndView("admin/categories/addOrEdit",model);
        }
        model.addAttribute("message", "Không tồn tại!");
        return new ModelAndView("forward:/admin/categories", model);
    }

    @GetMapping("delete/{categoryId}")
    public ModelAndView delete(ModelMap model,
                               @PathVariable("categoryId") Long categoryId){
        categoryService.deleteById(categoryId);
        model.addAttribute("message","Xóa thành công!");
        return new ModelAndView("forward:/admin/categories", model);
    }

    @GetMapping("/search")
    public String search(ModelMap model,
                         @RequestParam(name="name",required = false) String name){
        List<Category> list = null;
        if(StringUtils.hasText(name)){
            list = categoryService.findByCategoryNameContaining(name);
        }else{
            list = categoryService.findAll();
        }
        model.addAttribute("categories",list);
        return "admin/categories/search";
    }

    @GetMapping("/searchpagination")
    public String search(ModelMap model,
                         @RequestParam(name="name",required = false) String name,
                         @RequestParam("page") Optional<Integer> page,
                         @RequestParam("size") Optional<Integer> size){
        int count = (int) categoryService.count();
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(3);

        Pageable pageable = PageRequest.of(currentPage-1,pageSize, Sort.by("categoryId"));

        Page<Category> resultPage = null;
        if(StringUtils.hasText(name)){
            resultPage = categoryService.findByCategoryNameContaining(name,pageable);
            model.addAttribute("name",name);
        }else{
            resultPage = categoryService.findAll(pageable);
        }
        int totalPage = resultPage.getTotalPages();
        if(totalPage > 0){
            int start = Math.max(1,currentPage -2);
            int end = Math.min(currentPage+2,totalPage);
            if(totalPage> count){
                if(end==totalPage) start = end - count;
                else if (start==1) end = start + count;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start,end).boxed().collect(Collectors.toList());
            model.addAttribute("pageNumbers",pageNumbers);
        }
        model.addAttribute("categoryPage",resultPage);
        return "admin/categories/searchpagination";
    }
}

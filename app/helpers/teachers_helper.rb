module TeachersHelper
  def set_page_name(page_name)
    self.current_teacher_page=page_name
  end
  
  def current_teacher_page=(page_name)
    @page_name = page_name
  end

  def current_teacher_page
     @page_name || "aa"
  end

end

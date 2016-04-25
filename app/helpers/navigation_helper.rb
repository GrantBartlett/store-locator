module NavigationHelper
  # Checks to see if brand is intiated and returns a class name
  def brand_class
    if !current_class.nil?
      "brand brand-" + current_class.downcase
    end
  end

  def current_class
    if !@brand.nil?
      @current_class ||= @brand.title
    else
      @current_class ||= "smswmedia"
    end
  end
end

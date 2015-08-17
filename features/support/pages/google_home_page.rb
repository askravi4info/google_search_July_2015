class GoogleHomePage
  include PageObject

  page_url 'www.google.com'


  text_field(:search_criteria, :id => 'lst-ib')
  button(:google_search_button, :class => 'lsb')
  div(:google_image, :id=> 'lga')


  def set_search_criteria(search_value)
    self.search_criteria = search_value
    google_search_button_element.click
  end

  def google_image_exist?
    google_image_element.exists?
  end


end
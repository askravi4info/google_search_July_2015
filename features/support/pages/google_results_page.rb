class GoogleResultsPage
  include PageObject

  div(:no_of_results, :id=> 'resultStats')
  link(:select_advanced_search, :class => 'ab_dropdownlnk')
  span(:select_settings, :id => 'ab_opt_icon')
  # link(:select_settings, :class => 'ab_button selected',:index=>0)
  # link(:select_gmail, :xpath => '//*[@id="abar_button_opt"]')






end
class ExpediaSearchResultsPage
  include PageObject

  spans(:price, :class=>'dollars price-emphasis')
  div(:search_filter, :id=>'filterContainer')

  def verify_sort_order_is_by_price
    actual_sort = []
    expected_sort = []
    wait_until{
      search_filter_element.visible?
    }
    expected_sort = price_elements.map(&:text).sort

    price_elements.each do |each_price|
      # p each_price.text
      actual_sort << each_price.text
    end

    fail "#{actual_sort} is not equal to #{expected_sort}" unless actual_sort == expected_sort
  end
end
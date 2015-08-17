Given(/^user is on expedia home page$/) do
  visit ExpediaMainPage
end

And(/^user should select the flights tab$/) do
  # on(ExpediaMainPage).select_flight_tab_element.click
  on(ExpediaMainPage).select_flight_tab
end

And(/^user selects (.+) airport from departure field$/) do |airport_name|
  on(ExpediaMainPage).set_departure_details 'columbus', 'Indianapolis, IN (IND-Indianapolis Intl.) near Columbus, IN'
  # on(ExpediaMainPage).set_departure_details 'columbus', @file['content']['airport_name']
end

And(/^searches for the flights availability$/) do
  on(ExpediaMainPage).search_button_element.click
  # on(ExpediaMainPage).search_button
end

And(/^user selects (.+) airport from arrival field$/) do |airport_name|
  on(ExpediaMainPage).set_arrival_details 'cleveland', 'Cleveland (CLE-All Airports) near Cleveland, OH'
end

And(/^user makes a (past|future) date flight search$/) do |past_future|
  if past_future == 'past'
    on(ExpediaMainPage).set_dep_arr_dates -3, 4
  else
    on(ExpediaMainPage).set_dep_arr_dates 3, 4
  end
end

Then(/^verify the "([^"]*)" error message is displayed$/) do |message|
  # on(ExpediaMainPage).verify_error_message message
  # fail "Error Message is not visible" unless on(ExpediaMainPage).error_messages_element.text.include? message
  # fail "Expected Error Message - #{message} is not same as Actual message - #{on(ExpediaMainPage).error_messages_element.text}" unless on(ExpediaMainPage).error_messages_element.text.include? message

  # on(ExpediaMainPage) do |page|
  #   fail "Expected Error Message - #{message} is not same as Actual message - #{page.error_messages_element.text}" unless page.error_messages_element.text.include? message
  # end

  on(ExpediaMainPage).error_messages_element.text.should include message
  # expect(on(ExpediaMainPage).error_messages_element.text).should include message

end

And(/^user enters the required fields$/) do
#   step 'user should select the flights tab'
# step "user selects 'Indianapolis, IN (IND-Indianapolis Intl.) near Columbus, IN' airport from departure field"
  on(ExpediaMainPage) do |page|
    page.select_flight_tab_element.click
    page.set_departure_details 'columbus', 'Indianapolis, IN (IND-Indianapolis Intl.) near Columbus, IN'
    page.set_arrival_details 'cleveland', 'Cleveland (CLE-All Airports) near Cleveland, OH'
  end
end


Then(/^verify the search results are displayed by price$/) do
  sleep 5
  on(ExpediaSearchResultsPage).verify_sort_order_is_by_price
end

When(/^I load and read the yml files$/) do
  on(ExpediaMainPage).load_data_yml
end

Then(/^verify the following error message are displayed$/) do |table|
  # table is a table.hashes.keys # => [:error_messages]
  table.hashes.each do |message|
    on(ExpediaMainPage).error_messages_element.text.should include message['error_messages']
  end


end
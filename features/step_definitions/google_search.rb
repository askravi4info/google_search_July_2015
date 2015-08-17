Given(/^the user is on Google home Page$/) do
  visit GoogleHomePage
end

When(/^user search for "([^"]*)"$/) do |search_value|
  on(GoogleHomePage).set_search_criteria search_value
end

And(/^user should see the google image$/) do
  # if on(GoogleHomePage).google_image_exist? == false
  #   p "Google Image Exists"
  # else
  #   p "Google Image does not Exist"
  #   fail
  # end
  image_exists = on(GoogleHomePage).google_image_exist?
  # fail "Actual Result is  - #{image_exists } and expected result is TRUE" unless image_exists == false

  # expect(image_exists).to eq false


end

Then(/^user should see the search results$/) do
  on(GoogleResultsPage) do |page|
    page.no_of_results_element.when_present
    p page.no_of_results
    sleep 1
    page.select_settings_element.click
    sleep 2
    page.select_advanced_search
  end
end

And(/^verify the page is navigated to Google Advanced Search page$/) do
  sleep 2
  # p on(GoogleAdvancedSearchPage).header
end

Given(/^the user is at Google home Page$/) do
  step 'the user is on Google home Page'
end



When(/^user search for the "([^"]*)"$/) do |arg|
  step "user search for #{arg}"
end
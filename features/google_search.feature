@regression
Feature: Google Search Functionality

  @gs_001
  @google_advanced_search
  Scenario: verify the user is able to search for a valid data
    Given the user is on Google home Page
    And user should see the google image
    When user search for "Dell Laptops"
    Then user should see the search results
    And verify the page is navigated to Google Advanced Search page


  @gs_001
  Scenario Outline: verify the user is able to search for all the valid data
    Given the user is on Google home Page
    And user should see the google image
    When user search for "<search_criteria>"
    Then user should see the search results
    And verify the page is navigated to Google Advanced Search page

  Examples:
    | search_criteria |
    | dell            |
    | toshiba         |


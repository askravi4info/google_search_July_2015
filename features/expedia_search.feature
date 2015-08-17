Feature: Verify the Flight Search Functionality

  Background:
    Given user is on expedia home page

  Scenario:Verify the user gets an error message when searching for past flights
    And user should select the flights tab
    And user selects "Indianapolis, IN (IND-Indianapolis Intl.) near Columbus, IN" airport from departure field
    And user selects "Cleveland (CLE-All Airports) near Cleveland, OH" airport from arrival field
    And user makes a past date flight search
    And searches for the flights availability
    Then verify the "The start or end date is prior to the current date." error message is displayed

  Scenario:Verify the sort order of the search results are by price
    And user enters the required fields
    And user makes a future date flight search
    And searches for the flights availability
    Then verify the search results are displayed by price

  Scenario: testing the yml files
    When I load and read the yml files

  Scenario:Verify different error messages when searching for past flights
    And user should select the flights tab
    And user makes a past date flight search
    And searches for the flights availability
    Then verify the following error message are displayed
      | error_messages                                      | dates  |
      | The start or end date is prior to the current date. | past   |
      | Please complete the highlighted origin field below. | future |

  @manual
  Scenario: verifying the look and feel of Expedia Home page
    Given I am on Expedia Home Page
    Then Verify the look and feel

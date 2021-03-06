Feature: Login

  As a user, I want to be able to login to my account to
  view accont details
  
  Scenario Outline: Attempting to login with valid credentials; <@email>
    Given the browser is at the "Login" page
    When the user tries to use "valid" credentials, "<email>" to login
    Then they are successfully logged in 
    And the title of the page should be "My account - My Store"

    @dev
    Examples:
      | email               |
      | diptosden@gmail.com |
    @int 
    Examples:
      | email                      |
      | sultanparvez.dsi@gmail.com |


  @regression
  Scenario Outline: Attempting to login with invalid credentials; <email>
    Given the browser is at the "Login" page
    When the user tries to use "invalid" credentials, "<email>" to login
    Then the title of the page should be "Login - My Store"
    And an authentication error message should say "<error>"

    Examples:
      | email                      | error                      |
      | alphatesterdsi@gmail.com   | Authentication failed.     |
      | betatesterdsi@gmail.com    | Authentication failed.     |
      | random login test          | Invalid email address.     |
      |                            | An email address required. |
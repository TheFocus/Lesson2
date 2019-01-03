Feature: register new user account and check some information on 'my page' page
  Scenario: register new user account, visit 'my page' page, check if the page is displayed, check if we are currently on correct page,
  check if the number of assigned and reported issues is 0

    Given I create temporary unique variable in order to create unique user account

    Given I create user account via api call

    When I visit 'Redmine' page
    And  I click button 'Sign in'
    And  I fill in 'Login' field with 'user_test1' text on 'Redmine sign in(random user account)' page
    And  I fill in 'Password' field with '1234qwer' text on 'Redmine sign in' page
    And  I click button 'Log in'
    Then I see 'Logged in as some_random_username'
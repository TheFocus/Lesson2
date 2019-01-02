Feature: register new user account and check some information on 'my page' page
  Scenario: register new user account, visit 'my page' page, check if the page is displayed, check if we are currently on correct page,
  check if the number of assigned and reported issues is 0

    Given I create temporary unique variable in order to create unique user account

    When I visit 'Redmine register' page
    And  I fill in 'Login' field with 'random_text' text on 'Redmine register' page
    And I fill in 'Password' field with '1234qwer' text on 'Redmine register' page
    And I fill in 'Password confirmation' field with '1234qwer' text on 'Redmine register' page
    And I fill in 'First name' field with 'James' text on 'Redmine register' page
    And I fill in 'Last name' field with 'Bond' text on 'Redmine register' page
    And I fill in 'Mail' field with 'random_generated_mail' text on 'Redmine register' page
    And I click button 'Register'
    Then I see 'Logged in as some_random_username'

    When I visit 'My page' page
    And I check if the page 'My page' is displayed
    And I check if the url of page 'My page' ends with '/my/page'
    Then I see 'Issues assigned to me (0)'
    And  I see 'Reported issues (0)'
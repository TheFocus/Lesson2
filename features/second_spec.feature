Feature: Log in to redmine page
  Scenario: Registered used logs in
    When I visit 'Redmine' page
    And I click button 'Sign in'
    And I fill in 'Login' field with 'user1' text on 'Redmine sign in' page
    And I fill in 'Password' field with '1234qwer' text on 'Redmine sign in' page
    And I click button 'Log in'
    Then I see 'Logged in as user1'

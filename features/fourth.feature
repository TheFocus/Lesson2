Feature: Registering and logging in to user account
  Scenario: Register new user account, visit 'My account' page, log out from user account, log in back to same account

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

    When I visit 'My account' page
    Then I click button 'Sign out'

    When I click button 'Sign in'
    And I fill in 'Login' field with 'random_text' text on 'Redmine sign in(random user account)' page
    And I fill in 'Password' field with '1234qwer' text on 'Redmine sign in' page
    And I click button 'Log in'
    Then I see 'Logged in as some_random_username'

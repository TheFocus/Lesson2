Feature: My First Feature

  Scenario: User visits Wikipedia page
    When I visit 'Wikipedia' page
    Then I see 'Welcome to Wikipedia'

    When I click button 'Wikipedia'
    Then I see 'From Wikipedia, the free encyclopedia'

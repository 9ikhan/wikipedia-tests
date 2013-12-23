Feature: Search
  As an user:
  I should be able to search for articles on wikipedia

  Scenario Outline: Search from home page for articles that have clear result
    Given I am on home page
    When I search for <search_term> in <language>
    Then I see the <search_term> page

    Examples:
     | search_term | language |
     | India       | English  |
     | Indien      | Deutsch  |


  Scenario Outline: Search from home page for articles that returns search results
    Given I am on home page
    When I search for <search_term> in <language>
    Then I see the Search results page
     
    Examples:
    | search_term      | language |
    | some search word | English  |
  
 


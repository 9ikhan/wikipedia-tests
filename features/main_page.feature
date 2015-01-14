Feature: Main Page As an user I should be able to view the wikipedia main page

  @sanity @chrome
  Scenario: Featured Article is displayed
    When I am on main page
    Then Headings are displayed
    | From today's featured article |
    | In the news                   |
    | Did you know...               |
    | On this day...                |
    | Today's featured picture      |




  

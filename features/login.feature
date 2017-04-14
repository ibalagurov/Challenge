@login
Feature: Login to application

#1------------------------------------------------------------------------------
Scenario: Login with valid login and password
  Given I am on the "Login" page
  When I login as default user
  Then I should see "Home" page
  And I should see "Signed in successfully" text at "data alert"
  And I should see only "Console, My Account, Log Out" account actions

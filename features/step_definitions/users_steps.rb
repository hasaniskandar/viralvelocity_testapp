### UTILITY METHODS ###

def build_valid_visitor
  @visitor ||= { :email => "example@example.com", :password => "please",
    :password_confirmation  => "please" }
end

def build_invalid_visitor
  @visitor ||= { :email => "something@somewhere.com" }
end

def find_user
  @user ||= User.where(email: @visitor[:email]).first
end

def create_user
  build_valid_visitor
  delete_user
  @user = User.create(@visitor)
end

def delete_user
  find_user
  @user.destroy unless @user.nil?
end

def fill_in_sign_up_form
  within("#form-sign-up") do
    fill_in "Email", :with => @visitor[:email]
    fill_in "Password", :with => @visitor[:password]
    fill_in "Password confirmation", :with => @visitor[:password_confirmation]
    click_button "Sign up"
  end
end

def fill_in_sign_in_form
  within("#form-sign-in") do
    fill_in "Email", :with => @visitor[:email]
    fill_in "Password", :with => @visitor[:password]
    click_button "Sign in"
  end
end

### GIVEN ###
Given /^I am an unregistered user$/ do
  build_valid_visitor
  delete_user
end

Given /^I am a registered user$/ do
  create_user
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am not logged in$/ do
  delete '/users/sign_out'
end

### WHEN ###
When /^I register$/ do
  click_link "Sign up"
end

When /^I complete the registration form$/ do
  fill_in_sign_up_form
end

When /^I login$/ do
  click_link "Sign in"
end

When /^I complete the login form$/ do
  fill_in_sign_in_form
end

### THEN ###
Then /^the registration lightbox should (not )?be visible$/ do |negative_indicator|
  page.has_selector? "#form-sign-up", :visible => negative_indicator.blank?
end

Then /^the registration should be complete$/ do
  page.has_content? "Welcome! You have signed up successfully."
end

Then /^I should be on the homepage$/ do
  page.has_selector? 'h1', 'Home'
end

Then /^I should be logged in$/ do
  page.has_link? "Sign out"
end

Then /^the login lightbox should (not )?be visible$/ do |negative_indicator|
  page.has_selector? "#form-sign-in", :visible => negative_indicator.blank?
end

Then /^login should be complete$/ do
  page.has_content? "Signed in successfully."
end

# ------------------------------------------------------------------------------
Given /^I am an invalid user$/ do
  create_user
  build_invalid_visitor
end

Then /^login should be incomplete$/ do
  page.has_content? "Invalid email or password."
end

Then /^invalid user login error message should be displayed$/ do
  page.has_content? "Invalid email or password."
end

Then /^I should not be logged in$/ do
  page.has_no_link? "Sign out"
end

Given /^I am logged in$/ do
  visit '/'
  click_link "Sign in"
  fill_in_sign_in_form
  page.has_content? "Signed in successfully."
end

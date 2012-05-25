### UTILITY METHODS ###

def build_contact
  @contact ||= { :name => "generic" }
end

def modify_contact(name)
  build_contact if @contact.nil?
  @contact[:name] = name
end

def create_contact(name)
  @user.contacts.create(:name => name)
end

def delete_contacts
  find_user
  @user.contacts.destroy_all unless @user.nil?
end

def fill_in_contact_form
  fill_in "Name", :with => @contact[:name]
end

Given /^I have no contacts$/ do
  delete_contacts
end

Given /^I have a new generic contact in mind$/ do
  build_contact
end

When /^I create a new contact$/ do
  click_link 'New'
end

Then /^the create a new contact lightbox should be displayed$/ do
  page.has_content? "New contact"
end

When /^I complete the new contact form with new generic contact in mind$/ do
  fill_in_contact_form
end

Then /^create a new contact should be complete with generic contact in mind$/ do
  click_button "Create Contact"
end

Then /^create a new contact success message should be displayed$/ do
  page.has_content? "Contact was successfully created."
end

Then /^create a new contact lightbox should not be displayed$/ do
  page.has_no_content? "New contact"
end

Then /^I should be on (?:the )?contacts page$/ do
  page.has_content? "Contacts"
end

Given /^I have a (.+) contact$/ do |name|
  create_contact(name)
end

Then /^contact list should contain count of (\d+) contacts?$/ do |count|
  page.has_selector? "table tbody tr"
end

Then /^contact list should contain (.+) contact$/ do |contact_name|
  page.has_content? contact_name
end

When /^I update contact (.+) contact$/ do |name|
  click_link "Edit"
end

Then /^the update contact lightbox should be visible with generic contact$/ do
  page.has_content? "Edit Contact"
end

When /^I complete update contact with (.+) contact$/ do |name|
  modify_contact(name)
end

Then /^update contact should be complete with modified generic contact$/ do
  fill_in_contact_form
  click_button "Update Contact"
end

Then /^update contact success message should be displayed$/ do
  page.has_content? "Contact was successfully updated."
end

Then /^update contact lightbox should not be visible$/ do
  page.has_no_content? "Edit Contact"
end

Given(/^I am not logged in visitor$/) do
  @home_page = HomePage.new
  @home_page.load
  expect(@home_page).to have_sign_in_button
end

When(/^I register '([^"]*)' user via Redmine 'UI'$/) do |string|
  user_register(string + "#{@time}")
end

Then(/^I see the '([^"]*)' user is registered$/) do |string|
  case string
  when 'developer'
    check_user_in_database(string + "#{@time}")
  when 'admin'
    check_ui_registered_user_in_database(string + "#{@time}")
  end
  end
And(/^I become logged in as '([^"]*)' user$/) do |user|
  expect(page).to have_content user + "#{@time}"
end

When(/^I create a project$/) do
  @projects = Projects.new
  @projects.load
  @new_project = NewProject.new
  @new_project.load
  @new_project.name.set "a#{@time}"
  @new_project.create.click
end

Then(/^I see that project is created on 'UI' level$/) do
  expect(@new_project).to have_content 'Successful creation'
end

And(/^I see that project is created on 'API' level$/) do
  check_project_in_database
end

When(/^I register '([^"]*)' user via Redmine 'API'$/) do |string|
  create_user_via_api(string + "#{@time}")
end

When(/^I add '([^"]*)' user as a member of the project$/) do |string|
  @projects = Projects.new
  @projects.load(project_name: "a#{@time}", second_arg: 'memberships', third_arg: 'new')
  @projects.checkbox(string + "#{@time}").click
  @projects.developer_checkbox.click
  @projects.add_member_button.click
end

Then(/^I can can see '([^"]*)' user in the project member list$/) do |string|
  expect(page).to have_content string + "#{@time}"
end

When(/^I create an issue and assign '([^"]*)' user to created issue$/) do |string|
  @projects = Projects.new
  @projects.load(project_name: "a#{@time}", second_arg: 'issues', third_arg: 'new')
  @projects.subject.set "#{@time}"
  select(string, from: 'Assignee')
  @projects.create_issue.click
end

Then(/^I see the issue is created$/) do
  expect(page).to have_content "created"
end

And(/^I see '([^"]*)' user is assigned to the issue$/) do |string|
  expect(page).to have_content "Assignee:\n" + string + "#{@time}"
end

When(/^I logout$/) do
  @projects.logout_button.click
end

When(/^I login as '([^"]*)' user$/) do |string|
  user_login(string)
end

When(/^I track time for the assigned issue$/) do
  @projects = Projects.new
  @projects.load(project_name: "a#{@time}", second_arg: 'issues')
  click_link("#{@time}")
  @projects.log_time_button.click
  @projects.time_entry_hours.set '8'
  select('Development', from: 'Activity')
  @projects.create_time_log.click
end

Then(/^I see the time is tracked properly$/) do
  expect(page).to have_content "Spent time:\n" + "8.00 h"
end

When(/^I close the issue$/) do
  @projects.edit_button.click
  select('Closed', from: 'Status')
  @projects.submit_issue_change.click
end

Then(/^I see the issue was closed$/) do
  expect(page).to have_content "Status:\n" + "Closed"
end

When(/^I close the project$/) do
  @projects = Projects.new
  @projects.load(project_name: "a#{@time}")
  accept_alert do
    @projects.close_project_button.click
  end
end

Then(/^I see it was successfully closed$/) do
  expect(page).to have_content "This project is closed and read-only."
end

Given(/^I create hash for test purposes$/) do
 create_users_hash
end

Given(/^I clean database from all user accounts\(except admin account\) and projects$/) do
  users_cleaning_tool
  projects_cleaning_tool
end
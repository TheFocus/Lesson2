class Projects < SitePrism::Page
  set_url 'http://10.128.232.50/projects{/project_name}{/second_arg}{/third_arg}'
  element :new_project, :xpath, '//*[@id="content"]/div[1]/a'
  element :new_member, :xpath, '//*[@id="tab-content-members"]/p[1]/a'
  element :add_member_button,:xpath, '//*[@id="new_membership"]/p/input'
  element :developer_checkbox, :xpath, '//*[@id="new_membership"]/fieldset[2]/div/label[2]/input'
  element :subject, '#issue_subject'
  element :create_issue, :xpath, '//*[@id="issue-form"]/input[3]'
  element :logout_button, :xpath, '//*[@id="account"]/ul/li[2]/a'
  element :log_time_button, :xpath, '//*[@id="content"]/div[1]/a[2]'
  element :time_entry_hours, '#time_entry_hours'
  element :activity, '#time_entry_activity_id'
  element :create_time_log,  :xpath, '//*[@id="new_time_entry"]/input[4]'
  element :edit_button, :xpath, '//*[@id="content"]/div[2]/a[1]'
  element :issue_status_id, '#issue_status_id'
  element :submit_issue_change, :xpath, '//*[@id="issue-form"]/input[6]'
  element :close_project_button, :xpath, '//*[@id="content"]/div[1]/a[2]'

  def checkbox(checkbox_locator)
    page.find('label', text: checkbox_locator)
  end
end

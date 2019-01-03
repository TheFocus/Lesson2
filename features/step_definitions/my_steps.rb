When(/^I visit '([^"]*)' page$/) do |page|
  case page
  when 'Wikipedia'
    visit 'https://en.wikipedia.org'
  when 'Redmine'
    @home_page = HomePage.new
    @home_page.load
  when 'Redmine register'
    @register_page = RegisterPage.new
    @register_page.load
  when 'My account'
    @my_account_page = MyAccount.new
    @my_account_page.load
  when 'My page'
    @my_page = MyPage.new
    @my_page.load
  end
end

Then(/^I see '([^"]*)'$/) do |string|
  if string == 'Logged in as some_random_username'
    expect(page).to have_content "user#{@time}"
  elsif string == 'Reported issues (0)'
    expect(page).to have_content string
  elsif string == 'Issues assigned to me (0)'
    expect(page).to have_content string
  end
end

When(/^I click button '([^"]*)'$/) do |button_name|
  case button_name
  when 'Wikipedia'
    find(:xpath, '//*[@id="mp-topbanner"]/div/div[1]/a').click
  when 'Sign in'
    @login_page = LoginPage.new
    @login_page.load
  when 'Log in'
    @login_page.login_button.click
  when 'Register'
    @register_page.login_button.click
  when 'Sign out'
    @my_account_page.signout_button.click
  end
end

And(/^I fill in '([^"]*)' field with '([^"]*)' text on '([^"]*)' page$/) do |field, text, page|
  case page
    when 'Redmine sign in'
      if field == 'Login'
        @login_page.login_field.set text
      elsif field == 'Password'
        @login_page.password_field.set text
      end
    when 'Redmine register'
    if field == 'Login'
      @register_page.login_field.set "user#{@time}"
    elsif field == 'Password'
      @register_page.password_field.set text
    elsif field == 'Password confirmation'
      @register_page.password_confirmation_field.set text
    elsif field == 'First name'
      @register_page.user_first_name_field.set text
    elsif field == 'Last name'
      @register_page.user_last_name_field.set text
    elsif field == 'Mail'
      @register_page.user_mail.set text + "#{@time}" + "@softserveinc.com"
    end
  when 'Redmine sign in(random user account)'
    if field == 'Login'
      @login_page.login_field.set "user#{@time}"
    end
  end
end


Given(/^I create temporary unique variable in order to create unique user account$/) do
  new_timestamp
end

And(/^I check if the page '([^"]*)' is displayed$/) do |page|
  case page
  when 'My page'
    expect(@my_page).to be_displayed
  end
end

And(/^I check if the url of page '([^"]*)' ends with '([^"]*)'$/) do |page, url|
  case page
  when 'My page'
    expect(@my_page.current_url).to end_with(url)
  end
end

Given(/^I create user account via api call$/) do
  create_user_via_api("user#{@time}")
end
module FeatureHelper
  def new_timestamp
    @time ||= Time.now.to_i
  end
  def user_register(user)
    @register_page = RegisterPage.new
    @register_page.load
    @register_page.login_field.set user
    @register_page.password_field.set '1234qwer'
    @register_page.password_confirmation_field.set '1234qwer'
    @register_page.user_first_name_field.set 'James'
    @register_page.user_last_name_field.set 'Bond'
    @register_page.user_mail.set user + "@softserveinc.com"
    @register_page.login_button.click
    expect(page).to have_content user
    sleep 3
  end
  def my_page
    @my_page = MyPage.new
    @my_page.load
    expect(@my_page).to be_displayed
    expect(@my_page.current_url).to end_with('/my/page')
    expect(page).to have_content 'Issues assigned to me (0)'
    expect(page).to have_content 'Reported issues (0)'
  end
  def my_account
    @my_account_page = MyAccount.new
    @my_account_page.load
    @my_account_page.signout_button.click
  end
  def user_login
    @login_page = LoginPage.new
    @login_page.load
    @login_page.login_field.set "user#{@time}"
    @login_page.password_field.set '1234qwer'
    @login_page.login_button.click
    expect(page).to have_content 'Logged in as ' + "user#{@time}"
    sleep 3
  end
end

World FeatureHelper
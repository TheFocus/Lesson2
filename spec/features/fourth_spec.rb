feature "Registering user account", js: true do


  scenario "Register new user account" do
    @register_page = RegisterPage.new
    @register_page.load
    random_user_name_part = Time.new.to_i.to_s
    @register_page.login_field.set 'user' + random_user_name_part
    @register_page.password_field.set '1234qwer'
    @register_page.password_confirmation_field.set '1234qwer'
    @register_page.user_first_name_field.set 'James'
    @register_page.user_last_name_field.set 'Bond'
    @register_page.user_mail.set 'ytrot' + random_user_name_part + '@softserveinc.com'
    @register_page.login_button.click
    expect(page).to have_content 'user' + random_user_name_part

    @my_account_page = MyAccount.new
    @my_account_page.load
    @my_account_page.signout_button.click

    @login_page = LoginPage.new
    @login_page.load
    @login_page.login_field.set 'user' + random_user_name_part
    @login_page.password_field.set '1234qwer'
    @login_page.login_button.click
    expect(page).to have_content 'Redmine'
    sleep 5
  end

end

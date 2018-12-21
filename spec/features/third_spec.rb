require_relative 'fourth_spec'
feature "Sining in to virtual application", js: true do


  scenario "Signing with correct credentials" do
    @login_page = LoginPage.new
    @login_page.load
    @login_page.login_field.set 'user1'
    @login_page.password_field.set '1234qwer'
    @login_page.login_button.click
    expect(page).to have_content 'Redmine'
  end

end
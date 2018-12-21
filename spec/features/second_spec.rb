feature "Log in to redmine page", js: true do
  scenario "Registered used logs in" do
    visit 'http://10.128.232.50/'
    find(:xpath, '//*[@id="account"]/ul/li[1]/a').click
    fill_in('Login', with: 'user')
    fill_in('Password', with: 'dBOX1ca6jgFw')
    find(:xpath, '//*[@id="login-submit"]').click
    expect(page).to have_content 'Logged in as user'
  end
end
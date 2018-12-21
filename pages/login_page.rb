class LoginPage < SitePrism::Page
  set_url 'http://10.128.232.50/login'

  element :login_field, '#username'
  element :password_field, '#password'
  element :login_button,  :xpath, '//*[@id="login-submit"]'
end
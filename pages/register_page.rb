class RegisterPage < SitePrism::Page
  set_url 'http://10.128.232.50/account/register'

  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :password_confirmation_field, '#user_password_confirmation'
  element :user_first_name_field, '#user_firstname'
  element :user_last_name_field, '#user_lastname'
  element :user_mail, '#user_mail'
  element :login_button, :xpath, '//*[@id="new_user"]/input[3]'
end
class MyAccount < SitePrism::Page
  set_url 'http://10.128.232.50/my/account'

  element :signout_button,  :xpath, '//*[@id="account"]/ul/li[2]/a'
end
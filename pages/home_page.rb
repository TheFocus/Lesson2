class HomePage < SitePrism::Page
  set_url 'http://10.128.232.50/'
  element :sign_in_button, :xpath, '//*[@id="account"]/ul/li[1]/a'
end
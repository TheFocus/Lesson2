feature "Registering user account", js: true do


  scenario "Register new user account" do

    new_timestamp
    user_register("user#{@time}")
    my_account
    user_login

  end

end

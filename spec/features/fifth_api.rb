feature "Registering user account", js: true do


  scenario "Register new user account" do

    new_timestamp
    create_user_via_api("user#{@time}")
    user_login

  end

end
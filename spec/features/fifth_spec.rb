

feature "Registering user account", js: true do


  scenario "Register new user account" do

    new_timestamp
    user_register("user#{@time}")
    my_page

  end

end

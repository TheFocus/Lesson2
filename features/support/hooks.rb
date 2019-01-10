After('@task7') do
  users_cleaning_tool
  projects_cleaning_tool
end

Before('@task7') do
  create_users_hash
  @home_page = HomePage.new
  @home_page.load
  expect(@home_page).to have_sign_in_button
  new_timestamp
end

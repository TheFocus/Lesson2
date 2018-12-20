feature "Visit wikipedia page", js: true do


  scenario "Unregistered visitor visits home page" do
    visit 'https://en.wikipedia.org'
    expect(page).to have_content 'Welcome to Wikipedia'
  end

end
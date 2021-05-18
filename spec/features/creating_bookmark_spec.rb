# As a user
# So i can visit websites quickly 
# I want to create a bookmark for later use

feature 'create bookmark' do
  scenario 'user can create a bookmark' do
    visit('/')
    click_button('New Bookmark')
    fill_in('url', with: 'http://www.medium.com')
    click_button('Submit')
    expect(page).to have_content('http://www.medium.com')
  end
end
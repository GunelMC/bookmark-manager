feature 'viewing bookmarks' do
  scenario 'user can see saved bookmarks' do
    visit('/')
    click_button('View')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.makersacademy.com')
  end
end
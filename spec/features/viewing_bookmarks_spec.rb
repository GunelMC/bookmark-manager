feature 'viewing bookmarks' do
  scenario 'user can see saved bookmarks' do
    visit('/')
    click_button('View')
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.amazon.com')
  end
end
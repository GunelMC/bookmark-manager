require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can see saved bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com")
    Bookmark.create(url: "http://www.amazon.com")
    Bookmark.create(url: "http://www.google.com")

    visit('/')
    click_button('View')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.amazon.com')
  end
end
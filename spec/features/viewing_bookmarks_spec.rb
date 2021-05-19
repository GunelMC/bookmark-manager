require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can see saved bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.amazon.com", title: "Amazon")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit('/')
    click_button('View')
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Amazon', href: "http://www.amazon.com")
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end
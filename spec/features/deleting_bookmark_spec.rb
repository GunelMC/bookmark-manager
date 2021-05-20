require 'byebug'

feature 'Deleting a bookmark' do
  scenario 'user deletes a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.reddit.com', title: 'Reddit')
    visit('/bookmarks')
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com')
    # within('.bookmarks-list') do
    #   click('Delete', match => :first)
      # find('.bookmarks-list', match: :first).click_button('Delete')
      first('.bookmarks-list').click_button('Delete')
    # end
    expect(page).not_to have_link('Reddit', href: 'http://www.reddit.com')
  end 
end 
require 'bookmark'
require 'database_helpers'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all saved bookmarks' do
      con = PG.connect(dbname: 'bookmark_manager_test')
      
      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")

      Bookmark.create(url: "http://www.amazon.com", title: "Amazon")
      Bookmark.create(url: "http://www.google.com", title: "Google")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create ' do

    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url:'http://www.medium.com', title: 'Medium')
     persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Medium'
      expect(bookmark.url).to eq 'http://www.medium.com'

    end
  end

end
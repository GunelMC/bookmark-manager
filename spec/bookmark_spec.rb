require 'bookmark'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all saved bookmarks' do
      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.amazon.com", title: "Amazon")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      
      expect(described_class.all.length).to eq 3
      expect(described_class.all.first.title).to eq "Makers Academy"
      expect(described_class.all.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.create ' do
    it 'can store a url in the database' do
      described_class.create(url: "http://www.medium.com", title: 'Medium')
      
      expect(Bookmark.all.first.url).to eq("http://www.medium.com")
      expect(Bookmark.all.first.title).to eq('Medium')
    end
  end

end
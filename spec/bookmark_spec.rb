require 'bookmark'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all saved bookmarks' do
      con = PG.connect(dbname: 'bookmark_manager_test')
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.amazon.com');")

      expect(described_class.all).to include("http://www.google.com")
      expect(described_class.all).to include("http://www.makersacademy.com")
      expect(described_class.all).to include("http://www.amazon.com")
    end
  end

  describe '.create ' do
    it 'has a create method' do
      expect(described_class).to respond_to(:create).with(1).argument 
    end

    it 'can store a url in the database' do
      described_class.create("http://www.medium.com")
      expect(described_class.all).to include("http://www.medium.com")
    end
  end

end
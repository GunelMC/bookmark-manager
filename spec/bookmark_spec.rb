require 'bookmark'

RSpec.describe Bookmark do
  describe '#all' do
    it 'returns all saved bookmarks' do
      expect(described_class.all).to include("www.google.com")
      expect(described_class.all).to include("www.amazon.com")
    end
  end
end
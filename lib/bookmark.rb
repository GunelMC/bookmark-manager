require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    results = con.exec( 'SELECT * FROM bookmarks;' )
    results.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    con.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
  end

end
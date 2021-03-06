require 'pg'

class Bookmark
  def self.all
    
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }

    
      # ["http://www.makersacademy.com",
      # "http://www.destroyallsoftware.com",
      # "http://www.google.com"] 
    

  end
  
  def self.create(new_url)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{new_url}');")

  end

end
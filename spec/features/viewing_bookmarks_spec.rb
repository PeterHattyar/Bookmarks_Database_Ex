require 'pg'

feature 'Test Page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Main Page'
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_button('Add new bookmark')
  end
end

feature 'On Viewing bookmarks page' do
  scenario 'A user clicks new bookmarks button' do
    visit('/bookmarks')
    click_on 'Add new bookmark'

    expect(page).to have_button('Add bookmark')

  end
end

feature 'On Viewing bookmarks page' do
  scenario 'A user clicks new bookmarks button' do
    visit('/bookmarks')
    click_on 'Add new bookmark'
    fill_in 'url', with: 'http://www.bbc.co.uk'
    click_on 'Add bookmark'
    
    expect(page).to have_content "http://www.bbc.co.uk"

  end
end
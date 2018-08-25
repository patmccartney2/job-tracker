require 'rails_helper'
describe 'user can view the index page for categories' do
  scenario 'user can navigate to categories/index and view all categories' do
    category = Category.create!(title: "Hunter")

    visit categories_path

    expect(page).to have_link("#{category.title}")
    expect(page).to have_link("Create New Category")
  end
end

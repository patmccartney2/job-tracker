require 'rails_helper'

describe 'user can create a new categoy' do
  describe 'user can see the category create page' do
    scenario 'user can click link from index page to nav to create page' do

    visit categories_path

    click_on("Create New Category")

    expect(current_path).to eq(new_category_path)
    end
  end
  describe 'when user creates category navs to that category show page' do
    scenario 'user clicks submit on category create form and redirects to category show' do

      visit new_category_path

      fill_in("Title", :with => "Magician")
      click_on("Create Category")

      category = Category.find_by(title: "Magician")

      expect(current_path).to eq(category_path(category))
    end
  end

  describe 'user cannot enter multiple categories with the same title' do
    scenario 'user attempts to add a duplicate category redirects to category/new' do

      Category.create(title: "faller")

      visit new_category_path

      fill_in("Title", :with => "faller")
      click_on("Create Category")

      expect(current_path).to eq(new_category_path)
    end
  end

end

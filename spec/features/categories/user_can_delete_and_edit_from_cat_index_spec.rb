require 'rails_helper'

describe 'user can edit a category' do
  scenario 'user clicks edit and is redirected to edit page' do
    category = Category.create(title: "Seamstress")

    visit categories_path

    click_on("Edit")

    expect(current_path).to eq(edit_category_path(category))
  end
  scenario 'user fills in edit form and submits changes and directs to new show page' do
    category = Category.create(title: "Seamstress")

    visit edit_category_path(category)

    fill_in("Title", :with => "Seamer")
    click_on "Update Category"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Seamer")
  end
end
  describe 'user can delete a category from category index' do
    scenario 'user clicks delete and is redirected to updated index page' do
      category = Category.create(title: "Beet Farmer")

      visit categories_path

      click_on("Delete")

      expect(current_path).to eq(categories_path)
      within(".category-class") do
        expect(page).to_not have_content("#{category.title}")
      end
      expect(page).to have_content("#{category.title} was successfully deleted!")
    end
  end

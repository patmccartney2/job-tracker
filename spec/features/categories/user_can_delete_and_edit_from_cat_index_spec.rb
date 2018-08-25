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

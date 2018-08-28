require 'rails_helper'

describe 'company contacts' do
  scenario 'user can see a field for contact input on company page' do
    company = Company.create!(name: "Evil Industries")
    category = Category.create!(title: "World Domination")
    job = Job.create!(title: "Henchman 1", description: "Disposable Meat", level_of_interest: 75,
                      city: "New New York", category_id: category.id, company_id: company.id )
    job_2 = Job.create!(title: "Henchman 2", description: "Disposable Meat", level_of_interest: 70,
                      city: "New New York", category_id: category.id, company_id: company.id )
    visit company_path(company)

      fill_in("Name", :with => "Viktor")
      fill_in("Email", :with => "Viktor@gmail.com")
      fill_in("Position", :with => "Stabber")

      click_on("Create Contact")

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("Viktor@gmail.com")
      expect(page).to have_content("Viktor")
      expect(page).to have_content("Stabber")
    end
  end

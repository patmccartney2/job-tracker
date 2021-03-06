require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = Category.create(title: "Tech")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_jobs_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
end

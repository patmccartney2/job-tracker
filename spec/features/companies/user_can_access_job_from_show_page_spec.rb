require 'rails_helper'

describe 'user can access job show page from company show page' do
  scenario 'user can navigate to job show page by clicking link' do
    category = Category.create(title: "Tech")
    company = Company.create!(name: "Spoogle")
    job = company.jobs.create!(title: "Killer Whale Killer", level_of_interest: 98, city: "Bethel", category_id: category.id)

    visit company_jobs_path(company)

    click_on "Killer Whale Killer"

    expect(current_path).to eq(job_path(job))
  end
end

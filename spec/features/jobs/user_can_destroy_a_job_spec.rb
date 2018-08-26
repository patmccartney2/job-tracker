require 'rails_helper'

describe 'user can destroy a job' do
  scenario 'user can destroy a specific job from job index page' do
    category = Category.create(title: "Tech")
    company = Company.create!(name: "Spoogle")
    job = company.jobs.create(title: "Spooglest", level_of_interest: 100, city: "New Mars", category_id: category.id )

    visit company_path(company)

    click_on "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("#{job.title} was successfully deleted!")
  end
end

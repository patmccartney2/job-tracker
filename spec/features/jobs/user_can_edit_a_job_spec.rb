require 'rails_helper'

describe 'user can edit a job' do
  scenario 'user can edit specific job from the edit page' do
    company = Company.create!(name: "Spoogle")
    job = company.jobs.create!(title: "Killer whale killer", level_of_interest: 98, city: "Bethel")

    visit company_job_path(company, job)

    click_on "Edit"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}/edit")
  end
end

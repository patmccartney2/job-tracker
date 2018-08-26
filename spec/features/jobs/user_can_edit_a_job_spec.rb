require 'rails_helper'

describe 'user can edit a job' do
  scenario 'user can edit specific job from the edit page' do
    category = Category.create(title: "Tech")
    company = Company.create!(name: "Spoogle")
    job = company.jobs.create!(title: "Killer whale killer", level_of_interest: 98, city: "Bethel", category_id: category.id)

    visit job_path(job)

    click_on "Edit"

    expect(current_path).to eq(edit_job_path(job))
    expect(page).to have_field("Title")
    expect(page).to have_field("Level of interest")
    expect(page).to have_field("City")
    expect(page).to have_button("Update Job")
  end
end

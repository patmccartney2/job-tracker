require 'rails_helper'

describe 'user can see a job show page with a comment box' do
  scenario 'user can nav to job index page w/ appropriate fields' do
    company = Company.create!(name: "Sanchez Industries")
    category = Category.create!(title: "Lab Rat")
    job = Job.create!(title: "Rick Sanchez's Lab Assistant", description: "Ceartain Death", level_of_interest: 5,
                      city: "seatle", category_id: category.id, company_id: company.id)

    visit jobs_path

    expect(page).to have_link(job.title)
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end
  scenario 'user can see a box to enter comments for a job show page' do
    company = Company.create!(name: "Sanchez Industries")
    category = Category.create!(title: "Lab Rat")
    job = Job.create!(title: "Rick Sanchez's Lab Assistant", description: "Ceartain Death", level_of_interest: 5, city: "seatle", category_id: category.id, company_id: company.id)

    visit jobs_path

    click_on(job.title)

    expect(current_path).to eq(job_path(job))
    expect(page).to have_field("comment_text")
    expect(page).to have_button("Create Comment")
  end

  scenario 'user can submit a comment and view it on the job show page' do
    company = Company.create!(name: "Sanchez Industries")
    category = Category.create!(title: "Lab Rat")
    job = Job.create!(title: "Rick Sanchez's Lab Assistant", description: "Ceartain Death", level_of_interest: 5,
                      city: "seatle", category_id: category.id, company_id: company.id)

    visit job_path(job)

    fill_in("comment_text", with: "This is a Comment")
    click_on("Create Comment")
    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("This is a Comment")
  end
end

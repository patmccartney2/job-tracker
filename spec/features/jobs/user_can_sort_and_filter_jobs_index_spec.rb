require "rails_helper"

describe 'User enters query params' do
  scenario 'user enters query param ?location=Denver' do
    category = Category.create(title: "Tech")
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "Jr. Developer", level_of_interest: 45, city: "Anchorage", category_id: category.id)

    visit "/jobs?location=Denver"

    expect(page).to_not have_link(job2.title)
    expect(page).to have_link(job1.title)
  end
end

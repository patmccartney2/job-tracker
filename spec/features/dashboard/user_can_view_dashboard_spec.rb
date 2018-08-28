require 'rails_helper'

describe "User visits the dashboard" do
  it "should display count of jobs by level of interest" do
    category = Category.create(title: "Tech")
    company = Company.new(name: "Turing")
    job1 = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
    job2 = Job.create(title: "Jr Developer", level_of_interest: 15, city: "Anchorage", company: company, category_id: category.id)
    job3 = Job.create(title: "Coffee guy", level_of_interest: 15, city: "Denver", company: company, category_id: category.id)
    job4 = Job.create(title: "Screamer", level_of_interest: 40, city: "Anchorage", company: company, category_id: category.id)

    visit "/dashboard"

    expect(page).to have_content("Jobs at Level of Interest 15: 2")
    expect(page).to have_content("Jobs at Level of Interest 40: 2")
  end
  it "should show top three companies by average level of interest" do
    category = Category.create(title: "Tech")
    company1 = Company.create(name: "Turing")
    company2 = Company.create(name: "Pluring")
    company3 = Company.create(name: "Spluring")
    company4 = Company.create(name: "Mcluring")
    job1 = Job.create(title: "Developer", level_of_interest: 60, city: "Denver", company: company1, category_id: category.id)
    job2 = Job.create(title: "Jr Developer", level_of_interest: 40, city: "Anchorage", company: company1, category_id: category.id)
    job3 = Job.create(title: "Coffee guy", level_of_interest: 30, city: "Denver", company: company2, category_id: category.id)
    job4 = Job.create(title: "Screamer", level_of_interest: 30, city: "Anchorage", company: company2, category_id: category.id)
    job5 = Job.create(title: "Screamer", level_of_interest: 40, city: "Anchorage", company: company3, category_id: category.id)
    job6 = Job.create(title: "Screamer", level_of_interest: 40, city: "Anchorage", company: company3, category_id: category.id)
    job7 = Job.create(title: "Screamer", level_of_interest: 12, city: "Anchorage", company: company4, category_id: category.id)
    job8 = Job.create(title: "Screamer", level_of_interest: 2, city: "Anchorage", company: company4, category_id: category.id)


    visit "/dashboard"

    expect(page).to have_content(company1.name)
    expect(page).to have_content(company2.name)
    expect(page).to have_content(company3.name)
    expect(page).to_not have_content(company4.name)
  end
  it "should show a count of jobs by location with link to city filter" do
    category = Category.create(title: "Tech")
    company = Company.new(name: "Turing")
    job1 = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
    job2 = Job.create(title: "Jr Developer", level_of_interest: 15, city: "Anchorage", company: company, category_id: category.id)
    job3 = Job.create(title: "Coffee guy", level_of_interest: 15, city: "Denver", company: company, category_id: category.id)
    job4 = Job.create(title: "Screamer", level_of_interest: 40, city: "Creamsville", company: company, category_id: category.id)
    job5 = Job.create(title: "Memer", level_of_interest: 60, city: "Creamsville", company: company, category_id: category.id)
    job6 = Job.create(title: "Dreamer", level_of_interest: 40, city: "Creamsville", company: company, category_id: category.id)

    visit "/dashboard"

    expect(page).to have_link(job1.city)
    expect(page).to have_link(job2.city)
    expect(page).to have_link(job4.city)
    expect(page).to have_content("3 Jobs")
    expect(page).to have_content("2 Jobs")
    expect(page).to have_content("1 Jobs")
  end
end

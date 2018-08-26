require 'rails_helper'

describe 'user can visit category page displaying all jobs for catgory' do
  scenario 'user sees a header containing category title' do
    company = Company.create!(name: "Evil Industries")
    category = Category.create!(title: "World Domination")
    job = Job.create!(title: "Henchman 1", description: "Disposable Meat", level_of_interest: 75,
                      city: "New New York", category_id: category.id, company_id: company.id )
    job_2 = Job.create!(title: "Henchman 2", description: "Disposable Meat", level_of_interest: 70,
                      city: "New New York", category_id: category.id, company_id: company.id )

      visit category_path(category.id)
      expect(page).to have_content(category.title)
      expect(page).to have_link(job_2.title)
      expect(page).to have_link(job.title)
    end
  end

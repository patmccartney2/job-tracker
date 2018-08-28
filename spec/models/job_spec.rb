require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: 1)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, company, and category_id" do
        category = Category.create(title: "Tech")
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category_id: 1)
      expect(job).to respond_to(:category)
    end
  end
  describe 'Class methods' do
    it "should sort jobs by level of interest" do
      category = Category.create(title: "Tech")
      company = Company.new(name: "Turing")
      job1 = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
      job2 = Job.create(title: "Jr Developer", level_of_interest: 45, city: "Denver", company: company, category_id: category.id)
      job3 = Job.create(title: "Coffee guy", level_of_interest: 15, city: "Denver", company: company, category_id: category.id)

      expect(Job.sort_by_level_of_interest).to eq([job2,job1,job3])
    end
    it "should filter jobs by location" do
      category = Category.create(title: "Tech")
      company = Company.new(name: "Turing")
      job1 = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
      job2 = Job.create(title: "Jr Developer", level_of_interest: 45, city: "Anchorage", company: company, category_id: category.id)
      job3 = Job.create(title: "Coffee guy", level_of_interest: 15, city: "Denver", company: company, category_id: category.id)

      expect(Job.filter_by_location("Denver")).to eq([job1,job3])
    end
  end
end

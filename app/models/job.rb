class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.filter_by_location(location)
    where(city: location)
  end

  def self.sort_by_level_of_interest
    order(level_of_interest: :desc)
  end

  def self.count_of_level_of_interest
    group(:level_of_interest).count(:id)
  end

  def self.top_three_companies_by_interest
    hash = group(:company).average(:level_of_interest)
    ((hash.sort_by { |_key,value| -value})[0..2])
  end

  def self.jobs_by_location
    group(:city).count(:id)
  end

end

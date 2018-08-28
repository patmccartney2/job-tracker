class DashboardController < ApplicationController

  def index
    @jobs_loi = Job.count_of_level_of_interest
    @companies = Job.top_three_companies_by_interest
    @jobs_bl = Job.jobs_by_location
  end

end

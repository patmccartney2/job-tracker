require 'pry'

class JobsController < ApplicationController
  def index
    # @company = Company.find(params[:company_id])
    @jobs = Job.all
  end

  def new
    @companies = Company.all
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @company = Company.find(job_params[:company_id])
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      redirect_to new_company_job_path(@company)
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    @category = Category.find(@job.category_id)
    @comment = Comment.new()
    @all_comments = Comment.where(job_id: @job.id)
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
    @categories = Category.all
  end

  def update
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])

    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:company_id, :title, :description, :level_of_interest, :city, :category_id)
  end
end

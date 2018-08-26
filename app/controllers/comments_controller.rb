class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(comment_params)
    @job = Job.find(params[:job_id])
    @comment.job_id = @job.id
    @comment.save
    redirect_to job_path(@job)
  end

  private
  def comment_params
    params.require(:comment).permit(:job_id, :text)
  end

end

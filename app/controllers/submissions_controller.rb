class SubmissionsController < ApplicationController
  before_action :require_submissions_open
  before_action :require_authentication

  def new
    @submission = Current.user.submission || Current.user.build_submission
  end

  def create
    @submission = Current.user.build_submission(submission_params)

    if @submission.save
      redirect_to root_path, notice: "Haiku submitted!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @submission = Current.user.submission

    unless @submission.editable?
      redirect_to root_path, alert: "Submissions can only be edited within an hour of creation."
      return
    end

    if @submission.update(submission_params)
      redirect_to root_path, notice: "Haiku updated!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_submissions_open
    redirect_to root_path, alert: "Submissions are closed." unless submissions_open?
  end

  def submission_params
    params.require(:submission).permit(:line1, :line2, :line3)
  end
end

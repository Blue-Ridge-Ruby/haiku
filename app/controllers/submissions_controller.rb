class SubmissionsController < ApplicationController
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

    if @submission.update(submission_params)
      redirect_to root_path, notice: "Haiku updated!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:line1, :line2, :line3)
  end
end

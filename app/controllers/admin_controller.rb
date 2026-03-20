class AdminController < ApplicationController
  before_action :require_admin

  def index
    @submissions = Submission.includes(:user, :votes).order(created_at: :desc)
  end

  def toggle_discard
    submission = Submission.find(params[:id])

    if submission.discarded?
      submission.restore
    else
      submission.discard
    end

    redirect_to admin_path
  end
end

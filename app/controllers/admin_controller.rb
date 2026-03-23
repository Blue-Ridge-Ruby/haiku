class AdminController < ApplicationController
  before_action :require_admin

  def index
    @submissions = Submission.includes(:user, :votes).order(created_at: :desc)
  end

  def export
    submissions = Submission.kept.includes(:user, :votes).map do |submission|
      {
        github_username: submission.user.github_username,
        github_email: submission.user.github_email,
        line1: submission.line1,
        line2: submission.line2,
        line3: submission.line3,
        total_votes: submission.votes.size
      }
    end

    render json: submissions
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

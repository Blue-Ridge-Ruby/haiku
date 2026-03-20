class VotesController < ApplicationController
  before_action :require_authentication
  before_action :set_submission

  def create
    vote = @submission.votes.new(user: Current.user)

    if vote.save
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path, alert: vote.errors.full_messages.first
    end
  end

  def destroy
    vote = @submission.votes.find_by(user: Current.user)
    vote&.destroy
    redirect_back fallback_location: root_path
  end

  private

  def set_submission
    @submission = Submission.find(params[:submission_id])
  end
end

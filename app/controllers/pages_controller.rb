class PagesController < ApplicationController
  def home
    @submissions = Submission.kept.includes(:votes).sort_by { |s| -s.votes.size }
    if Current.user
      @voted_submission_ids = Current.user.votes.where(submission_id: @submissions.map(&:id)).pluck(:submission_id).to_set
    else
      @voted_submission_ids = Set.new
    end
  end
end

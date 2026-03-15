class PagesController < ApplicationController
  def home
    @submissions = Submission.kept.order("RANDOM()")
  end
end

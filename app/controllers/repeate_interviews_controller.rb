class RepeateInterviewsController < ApplicationController
  def new
    @repeate_interview = RepeateInterview.new
  end
end

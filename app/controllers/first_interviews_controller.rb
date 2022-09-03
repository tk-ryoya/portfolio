class FirstInterviewsController < ApplicationController
  def new
    @first_interview = FirstInterview.new
  end
end

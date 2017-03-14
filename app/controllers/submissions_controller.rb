class SubmissionsController < ApplicationController
  def index
  	@submissions = Submission.all
  end

  def new
  	@submission = Submission.new
  end

  def create
  	@submission = Submission.new(params.require(:submission).permit(:positionTitle,
  		:hours, :organizationName, :mailingAddress, :city, :zipcode))
  	if @submission.save
  		#redirect_to url_for(:controller => :submissions_controller, :action => :index)
  		redirect_to action:"index"
  		return
  	else
  		render "new"
  	end
  end
end

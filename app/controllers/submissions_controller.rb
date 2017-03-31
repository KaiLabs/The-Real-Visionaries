class SubmissionsController < ApplicationController
  def index
  	@submissions = Submission.all
  	if params[:search]
  		@submissions = Submission.search(params[:search]).order("created_at DESC")
  	else
  		@submissions = Submission.all.order("created_at DESC")
  	end

  	# @submissions = Submission.search(params[:search])
  	# render `submissions/index`
  end

  # def show
  # 	@submssion = Submission.find(params[:id])
 
  # end

  def new
  	@submission = Submission.new
  end

  def create
  	@submission = Submission.new(params.require(:submission).permit(:positionTitle,
  		:hours, :organizationName, :mailingAddress, :city, :zipcode, :rating, :season,
      :year, :compensation, :country))
  	if @submission.save
  		#redirect_to url_for(:controller => :submissions_controller, :action => :index)
  		redirect_to action:"index"
  		return
  	else
  		render "new"
  	end
  end
end

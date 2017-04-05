class SubmissionsController < ApplicationController
#  before_action :set_submission, only: [:show]

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

   def show
#   	@submssion = Submission.find(params[:search])

   end

  def new
  	@submission = Submission.new
  end

  def create
  	@submission = Submission.new(params.require(:submission).permit(:positionTitle,
  		:hours, :organizationName, :mailingAddress, :city, :zipcode, :rating, :season,
      :year, :compensation, :country, :organizationURL, :organizationContactName,
      :organizationContactJobTitle, :organizationContactEmail, :outsideCompensation,
      :cardinalInternship, :wesAlum, :organizationMission, :organizationRecommendation,
      :agriculture, :architecture, :artsEntertainment, :education, :energy, :financialServices,
      :foodBeverageCPG, :government, :healthcare, :hospitality, :manufacturing, :mediaMarketing,
      :nonProfit, :pharma, :professionalServices, :retailStores, :technology, :transportation, :other))
  	if @submission.save
  		#redirect_to url_for(:controller => :submissions_controller, :action => :index)
  		redirect_to action:"index"
  		return
  	else
  		render "new"
  	end
  end



#  private
#  def set_submission
#    @submission = Submission.find(params[:positionTitle])
#  end
end

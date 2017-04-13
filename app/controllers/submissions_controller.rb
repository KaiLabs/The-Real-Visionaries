class SubmissionsController < ApplicationController

  before_filter :authenticate_user

  def index
  	@submissions = Submission.all
  	if params[:search]
  		@submissions = Submission.search(params[:search])

  	end

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
  	  redirect_to action:"thankyou"
  		return
  	else
  		render "new"
  	end
  end

  def show
    # @submissions = Submission.all
    # if params[:search]
    #   @submissions = Submission.search(params[:search])
    # end
    @submission = Submission.find(params[:id])
  end

  def thankyou
  end

  private
  def set_submission
    @submission = Submission.find(params[:positionTitle, :compensation, :city])
  end
end

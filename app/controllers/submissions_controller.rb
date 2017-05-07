class SubmissionsController < ApplicationController

  before_filter :authenticate_user

  def index
  	@submissions = Submission.where(submissionReview: false)
    #@submissions = Submission.all
    #SEARCH
    if params[:search]
      @submissions = Submission.where(submissionReview: false).search(params[:search],params[:compensationSearch],params[:locationSearch])
    end

    #SORT
    if params[:sorting] == 'positionTitle'
       @submissions = @submissions.order('positionTitle ASC')
    elsif params[:sorting] == 'rating'
      @submissions = @submissions.order('rating ASC')
    elsif params[:sorting] == 'organizationName'
      @submissions = @submissions.order('organizationName ASC')
    elsif params[:sorting] == 'city'
      @submissions = @submissions.order('city ASC')
    elsif params[:sorting] == 'compensation'
      @submissions = @submissions.order('compensation ASC')
    elsif params[:sorting] == 'year'
      @submissions = @submissions.order('year ASC')
    #Industry sorting.....
  elsif params[:sorting] == 'agriculture'
    @submissions = @submissions.order('agriculture ASC')
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
      AddReviewMailer.addreviewmailer_email(@submission).deliver_now
      flash[:success] = "SENT EMAIL"
      redirect_to action:"thankyou"
      return
    else
      render "new"
    end
  end


  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    if @submission.update(submission_params)
    #redirect_to @submission
    redirect_to(:submissions => 'index')
  else
    render 'edit'
  end
end


def show
  @submission = Submission.find(params[:id])
end

def thankyou
end

#approving review through email...
def approvereview
  @submission = Submission.find(params[:id])
  if @submission.update_attribute(:submissionReview, true)
    redirect_to 'index'
  else
    render 'edit'
  end
end




def destroy
  @submission = Submission.find(params[:id])
  if @submission.destroy
      #redirect_to root_path
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Error deleting"
    end
  end


  private
  def set_submission
    @submission = Submission.find(params[:positionTitle, :compensation, :city])
  end
end

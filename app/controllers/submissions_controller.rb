class SubmissionsController < ApplicationController

  before_filter :authenticate_user

  def index
  	@submissions = Submission.all
    #SEARCH
    if params[:search]
      @submissions = Submission.search(params[:search],params[:compensationSearch],params[:locationSearch])
    end
    #SORT---TEST!!!
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


  def new
    session[:submission_params] ||= {}
    session[:submission_step] = "firstpage"
  	@submission = Submission.new(session[:submission_params])
    @submission.current_step = session[:submission_step]
  end

  def create
    session[:submission_params].deep_merge!(params[:submission]) if params[:submission]
    @submission = Submission.new(session[:submission_params])
    # (params.require(:submission).permit(:positionTitle,
    # :hours, :organizationName, :mailingAddress, :city, :zipcode, :rating, :season,
    # :year, :compensation, :state, :country, :organizationURL, :organizationContactName,
    # :organizationContactJobTitle, :organizationContactEmail, :outsideCompensation,
    # :cardinalInternship, :wesAlum, :organizationMission, :organizationRecommendation,
    # :agriculture, :architecture, :artsEntertainment, :education, :energy, :financialServices,
    # :foodBeverageCPG, :government, :healthcare, :hospitality, :manufacturing, :mediaMarketing,
    # :nonProfit, :pharma, :professionalServices, :retailStores, :technology, :transportation, :other))
    @submission.current_step = session[:submission_step]
    if params[:back_button]
      @submission.previous_step
      @submission.previous_step
    elsif @submission.last_step?
      @submission.save
      session[:submission_step] = session[:submission_params] = nil
      AddReviewMailer.addreviewmailer_email(@submission).deliver_now
      flash[:success] = "SENT EMAIL"
      redirect_to action:"thankyou"
      return
    end
    session[:submission_step] = @submission.current_step


    if @submission.new_record?
      render "new"
    else
      session[:submission_step] = session[:submission_params] = nil
      AddReviewMailer.addreviewmailer_email(@submission).deliver_now
      flash[:success] = "SENT EMAIL"
      redirect_to action:"thankyou"
      return
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def thankyou
  end



  private
  def set_submission
    @submission = Submission.find(params[:positionTitle, :compensation, :city])
  end
end

class SubmissionsController < ApplicationController

  before_filter :authenticate_user

  def index
    #admin
    @current_user = User.find_by id: session[:user_id]
    if @current_user.name == "Shirley He"
      @current_user.update_attribute :admin, true
      @submissions = Submission.all
      if params[:search]
        @submissions = Submission.search(params[:search],params[:compensationSearch],params[:locationSearch])
      end

    #SORT
    if params[:sorting] == '"positionTitle"'
     @submissions = @submissions.order('"positionTitle" ASC')
   elsif params[:sorting] == 'rating'
    @submissions = @submissions.order('rating ASC')
  elsif params[:sorting] == '"organizationName"'
    @submissions = @submissions.order('"organizationName" ASC')
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

else


 @submissions = Submission.where(submissionReview: true)
    #SEARCH
    if params[:search]
      @submissions = Submission.where(submissionReview: true).search(params[:search],params[:compensationSearch],params[:locationSearch])
    end

    #SORT
    if params[:sorting] == '"positionTitle"'
     @submissions = @submissions.order('"positionTitle" ASC')
   elsif params[:sorting] == 'rating'
    @submissions = @submissions.order('rating ASC')
  elsif params[:sorting] == '"organizationName"'
    @submissions = @submissions.order('"organizationName" ASC')
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
end

def new
 @submission = Submission.new
end


def create
 @submission = Submission.new(params.require(:submission).permit(:positionTitle,
  :hours, :organizationName, :mailingAddress, :city, :zipcode, :rating, :season,
  :year, :compensation, :state, :country, :organizationURL, :organizationContactName,
  :organizationContactJobTitle, :organizationContactEmail, :outsideCompensation,
  :cardinalInternship, :wesAlum, :organizationMission, :organizationRecommendation,
  :agriculture, :architecture, :artsEntertainment, :education, :energy, :financialServices,
  :foodBeverageCPG, :government, :healthcare, :hospitality, :manufacturing, :mediaMarketing,
  :nonProfit, :pharma, :professionalServices, :retailStores, :technology, :transportation, :other))
 if @submission.save
      AddReviewMailer.addreviewmailer_email(@submission).deliver
      flash[:success] = "SENT EMAIL"
      render 'thankyou'
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
    render 'show'
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
    #send mailer
    @current_user = User.find_by id: session[:user_id]
    AddReviewMailer.approvereviewmailer_email(@current_user).deliver
    render 'show'
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

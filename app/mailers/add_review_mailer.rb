class AddReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.add_review_mailer.addreviewmailer_email.subject
  #

  default from: 'admin@example.com'

  def addreviewmailer_email(submission)
    @submission = submission

    mail(to: "she@wesleyan.edu", subject: "New Internship Review Request")
  end

  def approvereviewmailer_email(current_user)
    @current_user = current_user

    mail(to: @current_user.email, subject: "Your internship review has been approved")
  end

end

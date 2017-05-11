class AddReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.add_review_mailer.addreviewmailer_email.subject
  #

  default from: 'admin@example.com'

  def addreviewmailer_email(submission)
    @submission = submission

    mail(to: "fcui@wesleyan.edu", subject: "New Internship Review Request")
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/add_review_mailer
class AddReviewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/add_review_mailer/addreviewmailer_email
  def addreviewmailer_email
    AddReviewMailer.addreviewmailer_email
  end

end

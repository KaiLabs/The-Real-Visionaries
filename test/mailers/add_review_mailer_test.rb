require 'test_helper'

class AddReviewMailerTest < ActionMailer::TestCase
  test "addreviewmailer_email" do
    mail = AddReviewMailer.addreviewmailer_email
    assert_equal "Addreviewmailer email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

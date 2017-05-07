class AddSubmissionReviewToSubmission < ActiveRecord::Migration[5.0]
  def change
  	add_column :submissions, :submissionReview, :boolean, default: false, null: false
  end
end



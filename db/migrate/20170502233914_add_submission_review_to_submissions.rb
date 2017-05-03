class AddSubmissionReviewToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :submissionReview, :boolean, :default => false
  end
end

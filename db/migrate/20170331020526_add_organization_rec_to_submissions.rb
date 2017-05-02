class AddOrganizationRecToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :outsideCompensation, :string
    add_column :submissions, :cardinalInternship, :boolean
    add_column :submissions, :wesAlum, :boolean
    add_column :submissions, :organizationMission, :string
    add_column :submissions, :organizationRecommendation, :string
  end
end

class AddColumnsToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :rating, :string
    add_column :submissions, :season, :string
    add_column :submissions, :year, :date
    add_column :submissions, :compensation, :string
    add_column :submissions, :country, :string
    add_column :submissions, :state, :string
  end
end
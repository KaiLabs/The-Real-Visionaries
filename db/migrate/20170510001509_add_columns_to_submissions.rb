class AddColumnsToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :rating, :string
    add_column :submissions, :season, :string
    add_column :submissions, :year, :date
    add_column :submissions, :compensation, :string
<<<<<<< HEAD:db/migrate/20170510001509_add_columns_to_submissions.rb
    add_column :submissions, :country, :string
    add_column :submissions, :state, :string
=======
    add_column :submissions, :country, :country
>>>>>>> c4c5bab83550b18a22f77fcb87544a17cc6901b9:db/migrate/20170330220610_add_columns_to_submissions.rb
  end
end
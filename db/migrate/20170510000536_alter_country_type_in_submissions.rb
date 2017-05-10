class AlterCountryTypeInSubmissions < ActiveRecord::Migration[5.0]
  def change
  	change_column :submissions, :country, :string
  end
end

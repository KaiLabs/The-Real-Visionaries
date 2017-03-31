class AddMoreColumnsToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :organizationURL, :string
    add_column :submissions, :organizationContactName, :string
    add_column :submissions, :organizationContactJobTitle, :string
    add_column :submissions, :organizationContactEmail, :string
  end
end

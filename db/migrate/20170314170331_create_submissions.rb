class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :positionTitle
      t.integer :hours
      t.string :organizationName
      t.string :mailingAddress
      t.string :city
      t.integer :zipcode

      t.timestamps
    end
  end
end

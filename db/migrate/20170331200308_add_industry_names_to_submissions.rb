class AddIndustryNamesToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :agriculture, :boolean
    add_column :submissions, :architecture, :boolean
    add_column :submissions, :artsEntertainment, :boolean
    add_column :submissions, :education, :boolean
    add_column :submissions, :energy, :boolean
    add_column :submissions, :financialServices, :boolean
    add_column :submissions, :foodBeverageCPG, :boolean
    add_column :submissions, :government, :boolean
    add_column :submissions, :healthcare, :boolean
    add_column :submissions, :hospitality, :boolean
    add_column :submissions, :manufacturing, :boolean
    add_column :submissions, :mediaMarketing, :boolean
    add_column :submissions, :nonProfit, :boolean
    add_column :submissions, :pharma, :boolean
    add_column :submissions, :professionalServices, :boolean
    add_column :submissions, :retailStores, :boolean
    add_column :submissions, :technology, :boolean
    add_column :submissions, :transportation, :boolean
    add_column :submissions, :other, :boolean
  end
end

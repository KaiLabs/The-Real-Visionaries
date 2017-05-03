# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170502233914) do

  create_table "submissions", force: :cascade do |t|
    t.string   "positionTitle"
    t.integer  "hours"
    t.string   "organizationName"
    t.string   "mailingAddress"
    t.string   "city"
    t.integer  "zipcode"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "rating"
    t.string   "season"
    t.date     "year"
    t.string   "compensation"
    t.         "country"
    t.string   "organizationURL"
    t.string   "organizationContactName"
    t.string   "organizationContactJobTitle"
    t.string   "organizationContactEmail"
    t.string   "outsideCompensation"
    t.boolean  "cardinalInternship"
    t.boolean  "wesAlum"
    t.string   "organizationMission"
    t.string   "organizationRecommendation"
    t.boolean  "agriculture"
    t.boolean  "architecture"
    t.boolean  "artsEntertainment"
    t.boolean  "education"
    t.boolean  "energy"
    t.boolean  "financialServices"
    t.boolean  "foodBeverageCPG"
    t.boolean  "government"
    t.boolean  "healthcare"
    t.boolean  "hospitality"
    t.boolean  "manufacturing"
    t.boolean  "mediaMarketing"
    t.boolean  "nonProfit"
    t.boolean  "pharma"
    t.boolean  "professionalServices"
    t.boolean  "retailStores"
    t.boolean  "technology"
    t.boolean  "transportation"
    t.boolean  "other"
    t.boolean  "submissionReview"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "admin",            default: false
  end

end

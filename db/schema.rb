# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "address", :force => true do |t|
    t.string  "addressLine1", :limit => 90, :null => false
    t.string  "addressLine2", :limit => 90
    t.string  "city",         :limit => 90
    t.string  "postalCode",   :limit => 10, :null => false
    t.integer "countryId",                  :null => false
    t.string  "latitude",     :limit => 20
    t.string  "longitude",    :limit => 20
    t.integer "eventId",                    :null => false
    t.string  "state",        :limit => 90
  end

  create_table "categories", :force => true do |t|
    t.string "name",        :limit => 45, :null => false
    t.string "description",               :null => false
  end

  create_table "cities", :force => true do |t|
    t.integer "countryId",               :null => false
    t.string  "name",      :limit => 45, :null => false
  end

  create_table "countries", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "eventTags", :force => true do |t|
    t.integer "eventId", :null => false
    t.integer "tagId",   :null => false
  end

  create_table "events", :force => true do |t|
    t.integer "categoryId",                                    :null => false
    t.integer "typeId",                                        :null => false
    t.string  "name",                                          :null => false
    t.text    "description",                                   :null => false
    t.string  "contactPerson",  :limit => 45
    t.string  "contactNumber",  :limit => 20
    t.string  "contactEmailId", :limit => 90
    t.integer "viewCount",                                     :null => false
    t.string  "isAbuse",        :limit => 1,  :default => "N", :null => false
    t.string  "isExpired",      :limit => 1,  :default => "N", :null => false
    t.date    "startDate"
    t.date    "endDate"
    t.time    "startTime"
    t.time    "endTime"
    t.string  "officalWebsite"
    t.string  "organizer"
    t.text    "specialNotes"
  end

  create_table "states", :force => true do |t|
    t.integer "countryId",               :null => false
    t.string  "name",      :limit => 45, :null => false
  end

  create_table "tags", :force => true do |t|
    t.string "description",               :null => false
    t.string "name",        :limit => 45, :null => false
  end

  create_table "types", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "userEvents", :force => true do |t|
    t.integer "userId",  :null => false
    t.integer "eventId", :null => false
  end

  create_table "users", :force => true do |t|
    t.string "displayName", :limit => 90,  :null => false
    t.string "firstName",   :limit => 45,  :null => false
    t.string "lastName",    :limit => 90,  :null => false
    t.string "emailId",     :limit => 90,  :null => false
    t.string "location",    :limit => 90
    t.string "profile_img", :limit => 180
    t.string "fbid",        :limit => 180
    t.string "fburl",       :limit => 180
    t.string "description", :limit => 500
    t.string "gender",      :limit => 10
    t.string "locale",      :limit => 90
    t.string "timezone",    :limit => 90
    t.string "birthday",    :limit => 20
  end

end

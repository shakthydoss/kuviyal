class UserEvent < ActiveRecord::Base
   set_table_name "userEvents"
   belongs_to :user
   has_many :event
end

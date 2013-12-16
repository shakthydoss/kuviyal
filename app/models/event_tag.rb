class EventTag < ActiveRecord::Base
   set_table_name "eventTags"
   belongs_to :event
   has_many :tag
end

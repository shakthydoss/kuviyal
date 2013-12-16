class Country < ActiveRecord::Base
  # attr_accessible :title, :body
    def name_for_select
  		name.capitalize
	end
end

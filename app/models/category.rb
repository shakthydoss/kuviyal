class Category < ActiveRecord::Base
  belongs_to :event

  	def name_for_select
  		name.capitalize
	end

end

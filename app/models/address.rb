class Address < ActiveRecord::Base
   set_table_name "address"
   attr_accessible :addressLine1, :addressLine2, :city, :state, :postalCode, :countryId
   belongs_to :event

end

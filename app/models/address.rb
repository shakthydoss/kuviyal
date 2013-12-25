class Address < ActiveRecord::Base
   
   set_table_name "address"
   attr_accessible :addressLine1, :addressLine2, :city, :state, :postalCode, :countryId
   belongs_to :event

   validates :postalCode, :presence => { :message => "Postal Code can't be empty." }  
   validates :countryId, numericality: { :greater_than => 0  , :message => "Please select country."} 
   validates :city, :presence => { :message => "City can't be empty." }  

end

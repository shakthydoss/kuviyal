class Event < ActiveRecord::Base
  # attr_accessible :title, :body
   attr_accessible  :categoryId ,  :typeId ,  :name,  :description ,  :contactPerson ,  :contactNumber ,  :contactEmailId,  :viewCount,  :isAbuse , :isExpired ,  :startDate ,  :endDate ,  :startTime ,  :endTime ,  :officalWebsite ,  :organizer ,  :specialNotes 

   validates :name, :presence => { :message => "Name can't be blank." }  
   validates :name , :uniqueness => { 
  								:case_sensitive => false,
  								:scope => :startDate , 
  								:message => "Event already exists in the current database."
  							    }


  validates :description , :presence => { :message => "Description can't be blank." }  
  validates :description , :length => { 
  								:minimum => 260 ,
  								:maximum => 1000                   
  							  }					
  
  validates :typeId, numericality: { :greater_than => 0 , :message => "Please select event type." }
  validates :categoryId, numericality: { :greater_than => 0  , :message => "Please select event category."}
  validates :organizer, presence: { :message => "Organizer can't be blank." }  
  
  validates :startDate , :presence => true

  validates_format_of :officalWebsite, :allow_blank => false, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix , :message => "Please enter valid url." 

  validates :contactPerson , :presence => { :message => "Please enter contact person name." }  
  validates :contactNumber, :numericality => { only_integer: true  , :message => "Please enter valid phone number"}, :allow_blank => true
  validates_format_of :contactEmailId, :allow_blank => false, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix , :message => "Please enter valid email id." 

  #registering custom validation methods 
  validate :event_date_cannot_be_in_past , :event_end_should_be_lesser_than_start_date


  #Custom Method for validating event start date 
  def event_date_cannot_be_in_past
	  	if !startDate.blank? and startDate < Date.today
	      errors.add(:startDate, "can't be in the past")
	    end
  end


  #custom Method for validating event end date 
  def event_end_should_be_lesser_than_start_date
  	if !startDate.blank?
  		if(to_date < startDate)
  			errors.add(:to_date,"End Date can't be lesser than start date.")
  		end
  	end 
  end


end

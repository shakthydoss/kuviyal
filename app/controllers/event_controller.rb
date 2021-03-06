class EventController < ApplicationController
  layout :resolve_layout

  def home 	
    if session[:kuviyal_is_user_authenticated]
      flash[:notice] = "<strong>Welcome</strong>! #{session[:kuviyal_user_name]}, you have successfully login."
    end
  end

  def add
     if(session[:kuviyal_is_user_authenticated] != true)
        flash[:notice] = "Please login to add events."
        redirect_to :action => 'home' and return;
     end

     flash[:notice] = "<strong>Hey </strong>, make sure you read the tips before posting the events"

      @event = Event.new

      @types = Type.all 
      select = Type.new 
      select.id = -1 
      select.name = "select"
      @types.insert(0, select)
      @SelecttypeId = -1

      @categories = Category.all
      select = Category.new 
      select.id = -1 
      select.name = "select"
      @categories.insert(0, select)
      @SelectcategoryId = -1

      @address = Address.new

      @country = Country.all
      select = Category.new 
      select.id = -1 
      select.name = "select"
      @country.insert(0, select) 
      @SelectcountryId = -1     
  
  end

  def save
      @event =  Event.new(params[:event])
      addrs = Address.new (params[:address])
      add_valid = true

      # validation for address
      if @event.categoryId != 3 && @event.categoryId != -1
        if !addrs.valid?
          add_valid = false
          @event.valid?
        end 
      end
      
      @event.viewCount = 1

      if add_valid && @event.save
         if @event.categoryId != 3 && @event.categoryId != -1
          addrs.eventId = @event.id
          addrs.city.downcase!
          addrs.save
            # saving tags
            if !params[:multiple_tags].nil?
              params[:multiple_tags].each do |t|
                tag = EventTag.new 
                tag.tagId = t.to_i
                tag.eventId = @event.id 
                #tag.save 
              end 
            end
         end
         flash[:notice] = "Event has been successfully added. Click <a href='/event/show/"+ @event.id.to_s + "'> here</a> view the event."
         redirect_to :action => 'home'
      else
        @types = Type.all 
        select = Type.new 
        select.id = -1 
        select.name = "select"
        @types.insert(0, select)
        @SelecttypeId  = @event.typeId 

        @categories = Category.all
        select = Category.new 
        select.id = -1 
        select.name = "select"
        @categories.insert(0, select)
        @SelectcategoryId = @event.categoryId

        @address = addrs

        @country = Country.all
        select = Category.new 
        select.id = -1 
        select.name = "select"
        @country.insert(0, select)  
        @SelectcountryId  = addrs.countryId

        render "add" 
      end 
  end

  def edit
    @event = Event.new
    @types = Type.all 
    select = Type.new 
    select.id = -1 
    select.name = "select"
    @types.insert(0, select)

    @categories = Category.all
    select = Category.new 
    select.id = -1 
    select.name = "select"
    @categories.insert(0, select)

    @address = Address.new

    @country = Country.all
    select = Category.new 
    select.id = -1 
    select.name = "select"
    @country.insert(0, select)     
  end

  def list
  end

 #set layout
 private
 def resolve_layout
    case action_name
    when "home"
      "home-layout"
    else
      #"application"
      "try-layout"
    end
 end

end

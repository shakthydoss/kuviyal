class EventController < ApplicationController
  layout :resolve_layout

  def home 	
    if session[:kuviyal_is_user_authenticated]
      flash[:notice] = "<strong>Welcome</strong>! #{session[:kuviyal_user_name]}, you have successfully login."
    end
  end

  def add
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

  def save
      @event =  Event.new(params[:event])
      addrs = Address.new (params[:address])

      if @event.save
         flash[:notice] = "Event has been successfully added. Click <a href='/event/show/"+ @event.id.to_s + "'> here</a> view the event."
         redirect_to :action => 'list'
      else
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

        @address = addrs
        @address.valid?

        @country = Country.all
        select = Category.new 
        select.id = -1 
        select.name = "select"
        @country.insert(0, select)  
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
      "application"
    end
 end

end

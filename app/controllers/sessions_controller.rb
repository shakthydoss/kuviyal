class SessionsController < ApplicationController
  
  def create
	auth_hash = request.env['omniauth.auth']
	if User.find_by_emailId(auth_hash['info']['email'])
		# user already exist 

		user = User.find_by_emailId(auth_hash['info']['email'])

		# set cokkie 
		session[:kuviyal_is_user_authenticated] = true
		session[:kuviyal_user_id] = user.id
  		session[:kuviyal_user_name] = user.firstName + " "+user.lastName
  		session[:kuviyal_user_email] = auth_hash['info']['email']

  		flash[:notice] = "<strong>Welcome</strong>! #{session[:kuviyal_user_name]}, you have successfully login."

		redirect_to root_url
	else
		user = User.new();	
		user.displayName = auth_hash['info']['name']
		user.emailId = auth_hash['info']['email']
		user.firstName = auth_hash['info']['first_name']
		user.lastName = auth_hash['info']['last_name']
		user.location = auth_hash['info']['location']
		user.profile_img = auth_hash['info']['image']
		user.fbid = auth_hash['uid']
		user.fburl = auth_hash['info']['urls']['Facebook']
		user.description = auth_hash['extra']['raw_info']['about']
		user.gender = auth_hash['extra']['raw_info']['gender']
		user.locale = auth_hash['extra']['raw_info']['locale']
		#user.username = auth_hash['extra']['raw_info']['username']
		user.birthday = auth_hash['extra']['raw_info']['birthday']
		user.timezone = auth_hash['extra']['raw_info']['timezone']
		# saving new user
		user.save 

		# set cookie 
		session[:kuviyal_is_user_authenticated] = true
		session[:kuviyal_user_id] = user.id
  		session[:kuviyal_user_name] = user.firstName + " "+user.lastName
  		session[:kuviyal_user_email] = user.emailId
  		
  		#sending welcome mail
		KuviyalMailer.welcome_mail(user).deliver

		flash[:notice] = "<strong>Welcome</strong>! #{session[:kuviyal_user_name]}, you have successfully login."

		#user interest page
		redirect_to root_url
	end 	


  end

  def destroy
  	session[:kuviyal_is_user_authenticated] = nil
  	session[:kuviyal_user_id] = nil
  	session[:kuviyal_user_name] = nil
  	session[:kuviyal_user_email] = nil
    sleep 3
    redirect_to root_url
  end

  def failure
  end
end

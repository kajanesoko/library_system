class UserController < ApplicationController
  def login
    if request.post?
    	user = User.where(:username => params[:username]).first
		
		unless user.blank?
			if User.authenticate(params[:username], params[:password]) #this is for encrypted values
			#if user.password_hash == params[:password]	#this is for plain text		
			session[:user_id] = user.id
			redirect_to '/home/index' and return
			end
		end
    end
    session[:user_id] = nil
    render :layout => 'login'
  end
end

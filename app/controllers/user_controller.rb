class UserController < ApplicationController
  def login
  
    if request.post?
    	user = User.where(:username => params[:username]).first
	
		unless user.blank?
			if user.password_hash == params[:password]
			
			session[:user_id] = user.id
			redirect_to '/home/index' and return
			end
		end
    end
    session[:user_id] = nil
  end
end

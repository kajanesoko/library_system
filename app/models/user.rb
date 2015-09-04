class User < ActiveRecord::Base
	self.table_name = "user"
	before_save :encrypt_password


	def encrypt_password
	  if password_hash.present?
	    self.salt = BCrypt::Engine.generate_salt
	    self.password_hash= BCrypt::Engine.hash_secret(password_hash, salt)
	  end
	end
	def self.authenticate(username, password)
		
 		user = User.find_by_username(username) rescue nil
 		return nil if user.blank? || password.blank?
  	if !user.blank? && user.password_hash == BCrypt::Engine.hash_secret(password, user.salt)  
    	user
   else   
    	nil 
   end
end
end

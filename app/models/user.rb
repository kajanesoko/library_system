require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	self.table_name = "user"
=begin
	attr_accessor :password_hash
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :password_hash, :presence => true, :uniqueness => true
	validates_length_of :password_hash, :in => 6..20, :on => :create
	before_save :encrypt_password
	#after_save :clear_password

	def encrypt_password
		#if password_hash.present?
			self.salt = BCrypt::Engine.generate_salt
			#raise BCrypt::Engine.hash_secret(self.password_hash, salt).inspect
			self.password_hash = BCrypt::Engine.hash_secret(self.password_hash, salt)	
		#end
		#raise "hello"
	end

	def clear_password
		self.password = nil
	end
=end
end

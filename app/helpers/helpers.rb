class Helpers
	attr_accessor :id

	def self.current_user(session_hash)
		User.find_by(id: session_hash[:user_id])
	end

	def self.is_logged_in?(session_hash)
		!!session_hash[:user_id]
		# if session_hash.keys.include?(:user_id)
		# 	true 
		# else
		# 	false
		# end
	end
end
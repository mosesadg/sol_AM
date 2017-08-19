class Apple < ApplicationRecord
  include Blending
end

class Orange < ApplicationRecord
  include Blending
end

module Blending
	extend ActiveSupport::Concern

	included do	
  	after_save :make_juice, if: :juice_approved?
	end	

	private
	
	def make_juice
		#do something
	end

	def juice_approved?
		self.class == Apple 
	end
end

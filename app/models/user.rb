class User < ApplicationRecord

	has_many :transfers

	validates :first_name, presence: true, length: {maximum: 20}
	validates :last_name, presence: true, length: {maximum: 20}
	validates :address_line_1, presence: true, length: {maximum: 50}
	validates_date :dob, presence: true


	def format_uppercase
		self.first_name = self.first_name.upcase
		self.last_name = self.first_name.upcase
		self.address_line_1 = self.first_name.upcase
	end
end

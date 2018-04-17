class PropertyInvesmentForm < ActiveRecord::Base
	validates :property_value, :loan_amount, :interest_rate, :capital_growth, :taxable_income, :proposed_rent, presence: true

	def property_value=(value)
	   self[:property_value] =  value.to_s.gsub(/\,/mi, '')
	end

	def loan_amount=(value)
	   self[:loan_amount] =  value.to_s.gsub(/\,/mi, '')
	end

	def taxable_income=(value)
	   self[:taxable_income] =  value.to_s.gsub(/\,/mi, '')
	end

	def proposed_rent=(value)
	   self[:proposed_rent] =  value.to_s.gsub(/\,/mi, '')
	end
end

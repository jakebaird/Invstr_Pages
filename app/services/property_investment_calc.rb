module PropertyInvestmentCalc

	def self.count(property_invesment_form)
		current_time = Time.now.to_i
		config_file = File.join(Rails.root, 'config', 'config.json')
		session = GoogleDrive::Session.from_config(config_file)

		current_file = session.spreadsheet_by_key("1jCNXfL-nZ7IGVI_8ZxJ0Zku8R3-HyPxFEHDxB9QhByE")
		new_file = current_file.copy("Property Investment Calculator #{current_time}")

		sheet = new_file.worksheets[0]

		sheet[3,2] = property_invesment_form.property_value
		sheet[5,2] = property_invesment_form.loan_amount
		sheet[10,2] = property_invesment_form.interest_rate.to_f / 100
		sheet[8,2] = property_invesment_form.capital_growth.to_f / 100
		sheet[11,2] = property_invesment_form.taxable_income
		sheet[6,2] = property_invesment_form.proposed_rent

		sheet.save
		sheet.reload

		data = {repayments: sheet[137,2], cashflow: sheet[140,2], yield: sheet[136,2], equity: sheet[138,2]}

		new_file.delete(true)
		return data
	end

end
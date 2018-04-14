class WelcomeController < ApplicationController
  def index
  	@property_invesment_form = PropertyInvesmentForm.new
  end
  
  def results
  	@property_invesment_form = PropertyInvesmentForm.new(property_invesment_form_params)

    respond_to do |format|
      if @property_invesment_form.save
      	@result = PropertyInvestmentCalc.count(@property_invesment_form)
        format.html { render :results }
      else
        format.html { render :index }
      end
    end
  end

  def terms
  end
  
  def privacy
  end

  private

  def property_invesment_form_params
    params.require(:property_invesment_form).permit(:property_value, :loan_amount, :interest_rate, :capital_growth, :taxable_income, :proposed_rent)
  end


end

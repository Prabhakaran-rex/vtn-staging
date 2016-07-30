require 'taxman'

class TaxesController < ApplicationController
  before_filter :authenticate_user!

  def irs_income
    if params[:code] == ENV["TAX_KEY"]
      user = current_user
      f1099 = Taxman::Printer.new
      f1099.initialize_data(tax_name: user.appraiser_extra.tax_name, tax_address: user.appraiser_extra.tax_address, tax_address_2: user.appraiser_extra.tax_address_2, tax_id: user.appraiser_extra.tax_id, tax_ein: user.appraiser_extra.tax_ein, tax_wages: user.appraiser_extra.tax_wages )
      respond_to do |format|
        format.pdf do
          send_data f1099.build(template_file: "1099.pdf").render , filename: "1099_#{current_user.id}.pdf", type: "application/pdf", disposition: "inline"
        end
      end
    else
      flash[:error]  = "Wrong tax generating key"
      redirect_to root_path
    end
  end
end

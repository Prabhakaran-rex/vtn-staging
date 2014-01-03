include ActionView::Helpers::NumberHelper
module Taxman
  class Printer
    @data = {}

    def initialize_data(params)
      @data = {}
      @data[:tax_address_1] = {value: params[:tax_name] + "\n" + params[:tax_address]}
      @data[:tax_id_1] = {value: params[:tax_id]}
      @data[:tax_wages_1] = {value: number_with_precision(params[:tax_wages], :precision => 2)}
      @data[:tax_ein_1] = {value: params[:tax_ein]}
      @data[:tax_address_2] = {value: params[:tax_name] + "\n" + params[:tax_address]}
      @data[:tax_id_2] = {value: params[:tax_id]}
      @data[:tax_ein_2] = {value: params[:tax_ein]}
      @data[:tax_wages_2] = {value: number_with_precision(params[:tax_wages], :precision => 2)}
    end

    def print(params)
      Prawn::Document.generate params[:output_file], template: params[:template_file] do |pdf|
        pdf.fill_form_with(@data)
      end
    end

    def build(params)
      Prawn::Document.new template: params[:template_file] do |pdf|
        pdf.fill_form_with(@data)
        pdf.render
      end
    end
  end
end

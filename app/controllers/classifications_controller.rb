class ClassificationsController < ApplicationController
	def create
		@classification = Classification.new(params[:classification])

		respond_to do |format|
			if @classification.save
				format.html { redirect_to @classification, notice: 'Classification was successfully created.' }
				format.json { render json: @classification, status: :created, location: @classification }
			else
				format.html { render action: "new" }
				format.json { render json: @classification.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@classification = Classification.find(params[:id])
		@classification.destroy

		respond_to do |format|
			format.html { redirect_to classifications_url }
			format.json { head :no_content }
		end
	end
end

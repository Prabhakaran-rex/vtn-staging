class TradeReferencesController < ApplicationController
  # GET /trade_references
  # GET /trade_references.json
  def index
    @trade_references = TradeReference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trade_references }
    end
  end

  # GET /trade_references/1
  # GET /trade_references/1.json
  def show
    @trade_reference = TradeReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trade_reference }
    end
  end

  # GET /trade_references/new
  # GET /trade_references/new.json
  def new
    @trade_reference = TradeReference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trade_reference }
    end
  end

  # GET /trade_references/1/edit
  def edit
    @trade_reference = TradeReference.find(params[:id])
  end

  # POST /trade_references
  # POST /trade_references.json
  def create
    @trade_reference = TradeReference.new(params[:trade_reference])

    respond_to do |format|
      if @trade_reference.save
        format.html { redirect_to @trade_reference, notice: 'Trade reference was successfully created.' }
        format.json { render json: @trade_reference, status: :created, location: @trade_reference }
      else
        format.html { render action: "new" }
        format.json { render json: @trade_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trade_references/1
  # PUT /trade_references/1.json
  def update
    @trade_reference = TradeReference.find(params[:id])

    respond_to do |format|
      if @trade_reference.update_attributes(params[:trade_reference])
        format.html { redirect_to @trade_reference, notice: 'Trade reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trade_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_references/1
  # DELETE /trade_references/1.json
  def destroy
    @trade_reference = TradeReference.find(params[:id])
    @trade_reference.destroy

    respond_to do |format|
      format.html { redirect_to trade_references_url }
      format.json { head :no_content }
    end
  end
end

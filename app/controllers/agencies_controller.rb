class AgenciesController < ApplicationController
before_action :set_agency, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token,only:[:create]

  def indexp
    @agencies = Agency.all
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def edit
  end

  def update
    if @agency.update(agency_params)
      redirect_to @agency, notice: "Information successfully updated."
    else
      render :edit
    end
  end

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(agency_params)
    if @agency.save
      @agency_id = @agency[:id]
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
      @agency.destroy
      redirect_to agencies_url, alert: "Agency successfully deleted."
  end

private

  def agency_params
    params.require(:agency)
    .permit(:name, :address1, :address2, :city, :state, :zip, :phone)
  end

  def set_agency
    @agency = Agency.find(params[:id])
  end

end

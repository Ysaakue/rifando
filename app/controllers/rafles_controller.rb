class RaflesController < ApplicationController
  before_action :set_rafle, only: [:show,:update,:destroy]
  def index
    @rafles = Rafle.all
    if  !request.query_parameters.blank? && !request.query_parameters["filter"].blank?
      filter = request.query_parameters["filter"]
      if filter == "owner"
        @rafles = current_user.my_rafles
      end
    end
    render json: @rafles
  end
  
  def show
    render json: @rafle
  end
  
  def create
    @rafle = Rafle.new(rafle_params)
    @rafle.owner = current_user
    if @rafle.save
      render json:{
        "status": "sucess",
        "data": @rafle
      }, status: :created
    else
      render json:{
        "status": "error",
        "data": @rafle.errors
      }, status: :unprocessable_entity
    end
  end
  
  def update
    if @rafle.update(rafle_params)
      render json:{
        "status": "sucess",
        "data": @rafle
      }
    else
      render json:{
        "status": "error",
        "data": @rafle.errors
      }
    end
  end
  
  def destroy
    @rafle.destroy
    render json:{"status": "success"}
  end
  private
  def rafle_params
    params.require(:rafle).permit(:name,:date_time,:description,:numbers_quantity,
      :premium,:winner_number,:image_url,:owner_id
    )
  end

  def set_rafle
    @rafle = Rafle.find(params[:id])
  end
end

class TicketsController < ApplicationController
  load_and_authorize_resource
  before_action :set_ticket, only: [:update, :show, :destory]
  before_action :set_rafle, only: [:index_by_rafle]

  def index
    @tickets = current_user.tickets
    render json: @tickets
  end
  
  def index_by_rafle
    @tickets = @rafle.tickets
    render json: @tickets
  end

  def show
    render json: @ticket
  end

  def create
    @ricket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      render json:{
        "status": "sucess",
        "data": @ticket
      }
    else
      render json:{
        "status": "error",
        "data": @ticket.errors
      }
    end
  end

  def update
    @ticket.paid!
    if @ticket.save
      render json:{
        "status": "sucess",
        "data": @ticket
      }
    else
      render json:{
        "status": "error",
        "data": @ticket.errors
      }
    end
  end
  
  def destroy
    @ticket.destroy
    render json:{"status": "sucess"}
  end
  private
  def ticket_params
    params.require(:ticket).permit(:number,:rafle_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_rafle
    @rafle = Rafle.find(params[:rafle_id])
  end
end

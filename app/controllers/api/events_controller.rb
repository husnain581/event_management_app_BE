# frozen_string_literal: false

class Api::EventsController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :update, :destroy]
  respond_to :json

  def index
    events = Event.where(organizer_id: current_user.id)
    render json: events
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end

  end

  def show
    render json: @event
  end
  
  def destroy
   @event.destroy
   head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :location).with_defaults(organizer_id: current_user.id)
  end
end
# frozen_string_literal: false

class Api::EventsController < ApplicationController 
  include ExceptionHandler
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :update, :destroy]
  respond_to :json

  def index
    user_organized_events = Event.organized_by_user(current_user)
    if user_organized_events.present?
      render json: user_organized_events
    else
      render json: 'events not found'
    end
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: event.errors, status: :unprocessable_entity
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

  def add_user_to_events
    rasie ActionController::ParameterMissing unless params["event_id"].present?
    event = Event.find_by(id: params["event_id"])
    if event.present?
      event_users = EventUser.new(event_id: event.id, user_id: current_user.id)
      if event_users.save
        render json: event_users, status: :created
      else
        render json: event_users.errors, status: :unprocessable_entity
      end
    else
     render json: "Event Not Found", status: :unprocessable_entity
    end
  end

  def get_events
    not_joined_events = Event.not_joined_by_user(current_user).not_organized_by_user(current_user)
    if not_joined_events.present?
      render json: not_joined_events
    else
      render json: "No events found"
    end
  end

  def joined_events
    events = current_user.events
    if events.present?
      render json: events
    else
      render json: "No events found"
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :location).with_defaults(organizer_id: current_user.id)
  end
end
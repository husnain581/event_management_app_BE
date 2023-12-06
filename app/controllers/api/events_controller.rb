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

  def add_user_to_events
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
    events = Event.left_outer_joins(:event_users).where.not('event_users.user_id': current_user.id).or(
             Event.where('event_users.user_id': nil)).distinct
    if events.present?
      render json: events
    else
      render json: "No events found"
    end
  end

  def joined_events
    events = current_user.events
    render json: events
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :location).with_defaults(organizer_id: current_user.id)
  end
end
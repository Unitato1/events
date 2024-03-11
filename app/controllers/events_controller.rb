class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
  end
  def create
    @event = current_user.events.build(event_parms)
    if @event.save
      redirect_to user_path(current_user), notice: "Created new project."
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def event_parms
    params.require(:event).permit(:date, :location, :description, :name)
  end
end

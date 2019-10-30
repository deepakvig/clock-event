class TrackEventsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show]
  before_action :set_track_event, only: [:show, :edit, :update, :destroy]
  before_action :set_event_user, only: [:create]

  # GET /track_events
  # GET /track_events.json
  def index
    @track_events = current_user.track_events
  end

  # GET /track_events/1
  # GET /track_events/1.json
  def show
  end

  # GET /track_events/new
  def new
    @track_event = TrackEvent.new
  end

  # GET /track_events/1/edit
  def edit
  end

  # POST /track_events
  # POST /track_events.json
  def create
    @track_event = TrackEvent.new(track_event_params)
    @track_event = @track_event.assign_time(params[:commit]) if !current_user && @event_user

    respond_to do |format|
      if @track_event.save
        if current_user
          format.html { redirect_to @track_event, notice: 'Track event was successfully created.' }
          format.json { render :show, status: :created, location: @track_event }
        else
          format.html { redirect_to new_track_event_path, notice: 'Track event was successfully created.' }
          format.json { render :show, status: :created, location: @track_event }
        end
      else
        format.html { render :new }
        format.json { render json: @track_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /track_events/1
  # PATCH/PUT /track_events/1.json
  def update
    respond_to do |format|
      if @track_event.update(track_event_params)
        format.html { redirect_to @track_event, notice: 'Track event was successfully updated.' }
        format.json { render :show, status: :ok, location: @track_event }
      else
        format.html { render :edit }
        format.json { render json: @track_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /track_events/1
  # DELETE /track_events/1.json
  def destroy
    @track_event.destroy
    respond_to do |format|
      format.html { redirect_to track_events_url, notice: 'Track event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track_event
      @track_event = TrackEvent.find(params[:id])
    end

    def set_event_user
      @event_user = current_user || User.find_by(name: params[:track_event][:your_name])
      params[:track_event][:user_id] = @event_user.id if @event_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_event_params
      params.fetch(:track_event, {}).permit(:description, :time_in, :time_out, :user_id)
    end
end

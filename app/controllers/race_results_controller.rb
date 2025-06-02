class RaceResultsController < ApplicationController
  before_action :is_marching_login_user, only: %i[show edit destroy]

  def new
    @race = Race.find(params[:race_id])
    @race_result = RaceResult.new()
    @event = @race.event
  end

  def create
    @race = Race.find(params[:race_id])
    @race_result = RaceResult.new(race_result_params)
    @events = @race.event
    if  @race_result.save
        redirect_to race_result_params, notice: "Race was successfully created."
    else
        render :new, status: :unprocessable_entity
    end
  end

  def show
    @race = Race.find(params[:race_id])
    @events = @race.event
    @race_result = @race.race_result
    @race_result_comment = RaceResultComment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def race_result_params
    params.require(:race_result).permit(:record_time_in_seconds, :impression)
          .merge(user_id: current_user.id, race_id: params[:race_id])
  end

  def is_marching_login_user
    race = Race.find(params[:race_id])
    unless race.user_id == current_user.id
      redirect_to races_path
    end
  end
end

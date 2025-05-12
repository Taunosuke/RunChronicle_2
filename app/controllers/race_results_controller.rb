class RaceResultsController < ApplicationController
  def new
    @race = Race.find(params[:race_id])
    @race_result = RaceResult.new()
    @events = @race.events
  end

  def create
    @race = Race.find(params[:race_id])
    @race_result = RaceResult.new(race_result_params)
    @events = @race.events
    if  @race_result.save
        redirect_to race_result_params, notice: "Race was successfully created."
      else
        render :new, status: :unprocessable_entity
    end
  end

  def show
    @race = Race.find(params[:race_id])
    @events = @race.events
    @race_result = RaceResult.find(params[:race_result_id])
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
end

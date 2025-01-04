class RacesController < ApplicationController
  before_action :authenticate_user!

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    @race.user_id = current_user.id
    if @race.save
      redirect_to @race, notice: "Race was successfully created."
    else
      render :new
    end
  end

  def index
    @races = current_user.races
    puts @races.inspect
  end

  private

  def race_params
    params.require(:race).permit(:name, :date)
  end
end

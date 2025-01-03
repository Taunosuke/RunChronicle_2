class RacesController < ApplicationController
  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      redirect_to @race, notice: 'Race was successfully created.'
    else
      render :new
    end
  end

  private

  def race_params
    params.require(:race).permit(:name, :date)
  end
end

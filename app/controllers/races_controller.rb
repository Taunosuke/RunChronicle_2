class RacesController < ApplicationController
  before_action :authenticate_user!

  def new
    @form = RaceForm.new
  end

  def create
    @form = RaceForm.new(race_params)
    if @form.save
      redirect_to races_path, notice: "Race was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @races = current_user.races
    puts @races.inspect
  end

  def show
    @race = Race.find(params[:id])
    @events = @race.events
  end

  def destroy
    race = Race.find(params[:id])
    race.destroy
    redirect_to races_path, notice: "大会予定を削除しました・"
  end

  private

  def race_params
    params.require(:race).permit(:name, :date, :event, :distance, :payment_due_date).merge(user_id: current_user.id)
  end
end

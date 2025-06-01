class RacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_race, only: %i[edit update]
  before_action :is_marching_login_user, only: %i[show edit destroy]

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
    @races = current_user.races.includes(:race_result)
    logger.debug @races.map { |r| [r.id, r.event&.event, r.event&.distance] }.inspect
  end

  def show
    @race = Race.find(params[:id])
    @event = @race.event
  end

  def destroy
    race = Race.find(params[:id])
    race.destroy
    redirect_to races_path, notice: "大会予定を削除しました。"
  end

  def edit
    @race = RaceForm.new(race: @race)
  end

  def update
    @race = RaceForm.new(race_params, race: @race)
    if @race.save
      redirect_to @race, notice: "大会予定を更新しました。"
    else
      render :edit
    end
  end

  private

  def race_params
    params.require(:race).permit(:name, :date, :event, :distance, :payment_due_date).merge(user_id: current_user.id)
  end

  def set_race
    @race = Race.find(params[:id])
  end

private
  def is_marching_login_user
    race = Race.find(params[:id])
    unless race.user_id == current_user.id
      redirect_to races_path
    end
  end
end

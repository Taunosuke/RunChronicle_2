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
     @races = current_user.races.includes(
      :race_result,
      :event,           # race_eventsテーブル経由でeventsを取得
      :stay_plan,
      :items            # race_itemsテーブル経由でitemsを取得
    )
  end

  def show
    @race = Race.find(params[:id])
    @event = @race.event
    @stay_plan = @race.stay_plan
  end

  def destroy
    Rails.logger.debug "=== DESTROY ACTION START ==="
    @race = Race.find(params[:id])
    @race.destroy
    redirect_to races_path, notice: "大会予定を削除しました。"
    Rails.logger.debug "Found race: #{@race.inspect}"
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

  def discover
    @races = Race.includes(:event, :user, :race_result).where.not(event: nil)
    Rails.logger.info "Race count: #{Race.count}"
    Rails.logger.info "Races without event: #{Race.where(event: nil).count}"
  end

  def select_items
    @race = Race.find(params[:id])
    @items = current_user.items
    @race_item_ids = @race.item_ids
  end

  def add_items
   @race = Race.find(params[:id])

   puts params.inspect

   if params[:race] && params[:race][:item_ids]
    @race.item_ids = params[:race][:item_ids]

   if @race.save
    redirect_to @race, notice: "アイテムが正常に追加されました"
   else
    redirect_to select_items_race_path(@race), alert: "アイテムの追加に失敗しました"
   end
   else
    redirect_to select_items_race_path(@race), alert: "アイテムが選択されていません"
   end
  end

  private

  def race_params
    params.require(:race).permit(:name, :date, :event, :distance, :payment_due_date, item_ids: []).merge(user_id: current_user.id)
  end

  def set_race
    @race = Race.find(params[:id])
  end

  def is_marching_login_user
    race = Race.find(params[:id])
    unless race.user_id == current_user.id
      redirect_to races_path
    end
  end
end

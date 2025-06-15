class StayPlansController < ApplicationController
  def new
    @stay_plan = StayPlan.new
  end

  def create
    @race = Race.find(params[:race_id])
    @stay_plan = @race.build_stay_plan(stay_plan_params)
    if @stay_plan.save
      redirect_to race_path(@race)
    else
      render :new, status: :unprocessable_entity
    end
  end


private

def stay_plan_params
  params.require(:stay_plan).permit(:race_id, :place_name, :address, :check_in_time, :check_out_time, :note)
end

def set_race
    @race = Race.find(params[:race_id])
end
end

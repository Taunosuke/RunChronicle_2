class StayPlansController < ApplicationController
  def new
    @stay_plan = StayPlan.new
  end

  def create
   @stay_plan = StayPlan.new(stay_plan_params)
   @stay_plan.save
   redirect_to race_path(set_race)
  end
end


private

def stay_plan_params
  params.require(:stay_plan).permit(:place_name, :address, :check_in_time, :check_out_time, :note)
end

def set_race
    @race = Race.find(params[:race_id])
end
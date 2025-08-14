class RaceResultCommentsController < ApplicationController
  def create
    race_result = RaceResult.find(params[:race_result_id])
    comment = current_user.race_result_comments.new(race_result_comment_params)
    comment.race_result_id = race_result.id
    comment.save
    redirect_to race_result_path(race_result)
end

private

  def race_result_comment_params
    params.require(:race_result_comment).permit(:content)
  end
end

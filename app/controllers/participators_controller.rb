class ParticipatorsController < ApplicationController
  def join
    part = current_user.participators.new(post_id: params[:id])
    part.save
    @total_parts = Participator.where(post_id: params[:id]).count
  end

  def leave
    part = current_user.participators.find_by(post_id: params[:id])
    part.destroy
    @total_parts = Participator.where(post_id: params[:id]).count
  end

  def assess
    @post = Post.find(params[:id])
    @assessment = Assessment.new
  end

  def create
    participator = Participator.where(user_id: current_user.id).where(post_id: params[:id].to_i)
    if participator.present?
      @assessment = Assessment.new(assessment_param)
      @assessment.participator_id = participator[0].id
      if @assessment.save
        redirect_to root_path
      else
        redirect_to assess_path(params[:id])
      end
    end
  end

  private

  def assessment_param
    params.require(:assessment).permit(:grade, :comment)
  end
end

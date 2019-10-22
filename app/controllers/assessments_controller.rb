class AssessmentsController < ApplicationController
  def new
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
end

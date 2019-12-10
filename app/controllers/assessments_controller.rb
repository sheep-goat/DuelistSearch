class AssessmentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @assessment = Assessment.new
  end

  def create
    if Participator.join?
      @assessment = Assessment.new(assessment_param)
      @assessment.user_id = current_user.id
      @assessment.post_id = params[:id].to_i
      if @assessment.save
        redirect_to root_path
      else
        redirect_to assess_path(params[:id])
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @assessment = @user.assessments
    @grade_count = @assessment.count_grade
  end

  private

  def assessment_param
    params.require(:assessment).permit(:grade, :comment)
  end
end

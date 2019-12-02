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
end

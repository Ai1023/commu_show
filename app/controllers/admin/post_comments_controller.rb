class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_game_path(params[:game_id])
  end
end

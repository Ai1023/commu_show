class Admin::GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
  end
end

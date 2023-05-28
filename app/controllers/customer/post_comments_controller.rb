class Customer::PostCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    game = Game.find(params[:game_id])
    game_comment = current_customer.post_comments.new(post_comment_params)
    game_comment.game_id = game.id
    if game_comment.save
      redirect_to game_path(game)
    else
      redirect_to game_path(game)
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to game_path(params[:game_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:game_comment)
  end
end

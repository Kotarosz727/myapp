# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_play

  def create
    @comment = @play.comments.build(comment_params)
    @comment.user_id = current_user.id
    render :index if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    render :index if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :play_id, :user_id)
  end

  def set_play
    @play = Play.find(params[:play_id])
  end
end

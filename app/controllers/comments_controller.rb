class CommentsController < ApplicationController
  def create
    profile = User.find(params[:user_id])
    @comment = profile.profile_comments.build(comment_params)
    @comment.author = current_user

    @comment.save
    redirect_to profile
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :message)
  end
end

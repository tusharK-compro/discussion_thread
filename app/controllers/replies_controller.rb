class RepliesController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to @post, notice: 'Reply was successfully posted.'
    else
      # If you want to show errors, you'd render the post show page again.
      # For simplicity, we'll just redirect with an alert.
      redirect_to @post, alert: 'Reply could not be posted.'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
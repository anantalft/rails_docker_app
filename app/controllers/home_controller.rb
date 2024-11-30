class HomeController < ApplicationController
  def index

    @message = "Dynamic"

    @posts = Post.all
  end

  def increment_async
    # Use IncrementCountJob instead of IncrementCountWorker
    IncrementCountJob.perform_async(params[:post_id])
    redirect_to root_path
  end


end


class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts.each do |pst|
      if pst.id == 1
        pst.title = "SPAM"
      elsif pst.id % 5 == 0
        pst.title = "SPAM"
      else
        pst.title
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end

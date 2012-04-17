class PagesController < ApplicationController


  def home
    @title = "Home"
    if signed_in?
    @micropost = Micropost.new if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def contact
    @title ="Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

 def news
    @title = "News"
  end

end

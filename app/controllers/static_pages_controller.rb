class StaticPagesController <ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

    def sign_up

    end

    def welcome

    end
end










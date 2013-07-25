class NewsController < SiteController
  def index
    @news_list = News.order(created_at: :desc).all
  end
end

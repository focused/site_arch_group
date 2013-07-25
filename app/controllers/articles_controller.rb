class ArticlesController < SiteController
  before_action do
    @articles = Article.order(:position).all
  end

  def index
    @article = Article.order(:position).first
  end

  def show
    @article = Article.find params[:id]
    render :index
  end
end

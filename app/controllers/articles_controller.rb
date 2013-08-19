class ArticlesController < SiteController
  before_action do
    @articles = Article.order(:position).all
  end

  def index
    @article = Article.order(:position).first
  end

  def show
    @article = Article.find params[:id]
    meta_tags title: [t('.title'), @article.title]
    render :index
  end
end

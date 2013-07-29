class WebDocumentsController < SiteController
  def home
    @doc = WebDocument.where(alias_name: 'home').first
    @news_list = News.order(created_at: :desc).limit(8).all
  end

  def contacts
    @doc = WebDocument.where(alias_name: 'contacts').first
  end

  def clients
    @clients = Client.order(:position).all
  end

  def about
    @doc = WebDocument.where(alias_name: 'about').first
    @employees = Employee.order(:position).limit(128).all
  end
end

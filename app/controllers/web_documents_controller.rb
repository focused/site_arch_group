class WebDocumentsController < SiteController
  def home
    @doc = WebDocument.where(alias_name: 'home').first
    @news_list = News.order(created_at: :desc).limit(8)
    @gallery_items = GalleryItem.order(:position)
  end

  def contacts
    @doc = WebDocument.where(alias_name: 'contacts').first
  end

  def clients
    @clients = Client.order(:position)
  end

  def about
    @doc = WebDocument.where(alias_name: 'about').first
    @employees = Employee.order(:position).limit(128)
  end
end

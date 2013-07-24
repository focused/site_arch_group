class WebDocumentsController < SiteController
  def home
    # lets(
    #   -> news     { NewsFeed.new.recent(5) },
    #   -> projects { Gallery.new.main(3) }
    # ).or(
    #   -> news     { 'Service unavailable' }
    # )
    # let(main_bg: "tmp/home_main_photo.jpg").
    #   >= { |v| "#{ v }?x=#{ params[:x] }" }.
    #   or 'NO BG :('

    # let(news: NewsFeed.new) { recent(5) }.or { 'Service unavailable' }.
    #   where { recent = -> }


  end

  def contacts
    # let contacts: ContactsCard
  end

  def clients
    # let clients: ClientsKeeper.all
  end

  def about
    # let about: AboutKeeper
  end
end

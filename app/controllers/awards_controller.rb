class AwardsController < SiteController
  before_action do
    @awards = Award.order(:position).all
  end

  def index
    @award = Award.order(:position).first
  end

  def show
    @award = Award.find params[:id]
    render :index
  end
end

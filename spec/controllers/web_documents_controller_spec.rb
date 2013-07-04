require 'spec_helper'

describe WebDocumentsController do
  it "GET home" do
    get :home
    response.should render_template('application')
  end
end

require 'spec_helper'

describe ApplicationController do
  controller do
    def any_action
      render '/spec/support/views/any_action.html.haml'
    end
  end

  it 'GET any_action' do
    routes.draw { get 'any_action' => 'anonymous#any_action' }
    get :any_action
    response.should render_template('inner')
  end
end


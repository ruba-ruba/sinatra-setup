require 'spec_helper'

RSpec.describe HomeApp do
  def app() described_class end

  it 'render /' do
    get '/'
    expect(last_response.status).to eq 200
  end 
end
require 'rails_helper'

RSpec.describe AmypodeService do
  it "can return the lat and long of an antipode" do
    service = AmypodeService.new
    pode_coords = {:lat=>22.3193039, :lng=>114.1693611}

    response = service.get_poded(pode_coords)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:data)
  end
end

require 'rails_helper'

RSpec.describe FlikrService do
  it "returns an image from lat and long" do
    service = FlikrService.new

    image = service.get_image({:lat=>39.7392358, :lng=>-104.990251})
    
    expect(image).to be_a(String)
  end
end

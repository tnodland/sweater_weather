class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def get_antipode
    service1 = GoogleService.new
    pode = service1.get_coords(@location)
    binding.pry
    service2 = AmypodeService.new
  end
end

require_relative('animal')
require_relative('owner')

class Shelter

  def initialize()
  end

  def list_animals()
    Animal.all()
  end

  def list_owners()
    Owner.all()
  end

end

module GridItem

  # If the module is included then the methods in the module become instance variables on the object including.
  # If the module is being extended the methods in the module become class variables on the object extending.
  # What we are doing here is when an object includes the Something module it will include Comparable automatically and extend the SomethingClassMethods module.

  def self.included(base)
    include Comparable
    base.extend(GridItemClassMethods)
  end

  # Used to check if Rovers are at the same location.
  def <=>(other_grid_item)
    @location <=> other_grid_item.location
  end

#Class Methods for things including this module.
  module GridItemClassMethods

    def create(name)
      object = new(name)
      instances.push(object)
      return object
    end

    def instances
      @instances ||= []
    end
  end

end

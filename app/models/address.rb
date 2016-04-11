class Address
  attr_accessor :city, :state, :location

  #initialize Point class
  def initialize(params)
    @city = params[:city]
    @state = params[:state]
    @location = Point.new(params[:location])
  end

  #Converts point into mongo hash
  def mongoize
  	{
  		:city => @city,
  		:state => @state,
      :loc => @location
  	}
  end

  #Return mongo object as ruby hash
  def self.mongoize object
  	case object
  		when nil then nil
  		when Hash then object
  		when Point then puts object.mongoize; object.mongoize
  	end
  end

  #Returns instance of class
  def self.demongoize object
  	case object
  		when nil then nil
  		when Hash then Point.new(object)
  		when Point then Point
  	end
  end

  def self.evolve object
  	case object
  		when nil then nil
  		when Hash then object
  		when Point then puts object.mongoize; object.mongoize
  	end
  end

end
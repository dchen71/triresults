class Point
  attr_accessor :longitude, :latitude

  #initialize Point class
  def initialize(params)
    if !params[:coordinates].nil?
      @longitude = params[:coordinates][0]
      @latitude = params[:coordinates][1]
    else
      @longitude = params[:lng]
      @latitude = params[:lat]
    end
  end

  #Converts point into mongo hash
  def mongoize
  	{
  		:type => "Point",
  		:coordinates => [@longitude, @latitude]
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

  #Update to database friendly form
  def self.evolve object
  	case object
  		when nil then nil
  		when Hash then object
  		when Point then puts object.mongoize; object.mongoize
  	end
  end

end

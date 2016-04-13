class Placing
  attr_accessor :name, :place

  #initialize Placing class
  def initialize(params)
    @name = params[:name] if !params[:name].nil?
    @place = params[:place] if !params[:place].nil?
  end

  #Converts point into mongo hash
  def mongoize
    {
      :name => @name,
      :place => @place
    }
  end

  #Return mongo object as ruby hash
  def self.mongoize object
    case object
      when nil then nil
      when Hash then object
      when Address then object.mongoize
    end
  end

  #Returns instance of class
  def self.demongoize object
    case object
      when nil then nil
      when Hash then Placing.new(object)
      when Address then Address
    end
  end

  #Convert object to database friendly form
  def self.evolve object
    case object
      when nil then nil
      when Hash then object
      when Address then object.mongoize
    end
  end

end

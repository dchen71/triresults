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
  		:type =>"Point",
  		:coordinates => [@longitude, @latitude]
  	}
  end


end

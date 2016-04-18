class LegResult
  include Mongoid::Document

  field :secs, type: Float

  def calc_ave
  	#subclasses will calc event-specific ave
  end

  after_initialize do |doc|
  	calc_ave
  end

  #Calc ave after manuallly updating self with provided value
  def secs=value
	self[:secs] = value
	calc_ave
  end
end

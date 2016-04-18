class BikeResult < LegResult
  include Mongoid::Document

  field :mph, type: Float

   def calc_ave
   	if event && secs
    	meters = event.meters
    	self.my_ave=meters.nil? ? nil : 12.1
   	end
   end
end

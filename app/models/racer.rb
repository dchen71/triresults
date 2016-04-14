class Racer
  include Mongoid::Document

  #Add in local id to info id
  before_create do |racer|
  	racer.info.id = racer.id
  end
end

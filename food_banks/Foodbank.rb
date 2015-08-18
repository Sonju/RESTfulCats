class Foodbank < ActiveRecord::Base

  def to_s
    "Food bank ID #{self.id} with a name of #{self.name} and #{self.address} and #{self.city}"
 end
end

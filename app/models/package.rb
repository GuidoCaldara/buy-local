class Package < ApplicationRecord
  has_many :products


  def select_label
    case self.name
    when "box"
     return "Confezione"
    when "jar"
     return "Barattolo"
    when "kg"
     return "Kilo"
    when "hg"
     return "Etto"
    when "g"
     return "Grammo"
    when "piece"
     return "Pezzo"
    end
  end
end

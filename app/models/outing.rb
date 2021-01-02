class Outing <ApplicationRecord
  has_many :outing_contestants
  has_many :contestants, through: :outing_contestants

  def number_of_contestants
    self.contestants.count
  end

end

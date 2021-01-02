class Bachelorette <ApplicationRecord
  has_many :contestants
  belongs_to :season

  def average_age_of_contestants
    self.contestants.average(:age).to_f
  end

  def hometowns
    self.contestants.map do |contestant|
      contestant.hometown
    end.uniq
    #self.contestants.group(:hometown).uniq
  end
end

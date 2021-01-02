class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :outing_contestants
  has_many :outings, through: :outing_contestants

  def season
    self.bachelorette.season_number
  end

  def season_description
    self.bachelorette.season.description
  end

end

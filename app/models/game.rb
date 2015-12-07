class Game < ActiveRecord::Base

  has_many :rounds, :class_name => "Round", :foreign_key => "game_id", :dependent => :destroy
  has_many :categories, :through => :rounds
  has_many :clues, :through => :categories
  validates :date, :uniqueness => true, :presence => true

  after_create :add_rounds

  def add_rounds
    round_names = ["Jeopardy", "Double Jeopardy", "Final Jeopardy"]

    round_names.each do |round_name|
      round = Round.new
      round.category = round_name
      round.game_id = self.id
      round.save
    end
  end

  def score
    value_right = self.clues.where(:right => true).sum(:value)
    value_wrong = self.clues.where(:wrong => true).sum(:value)

    return value_right - value_wrong
  end
end

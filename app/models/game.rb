class Game < ActiveRecord::Base

  has_many :rounds, :class_name => "Round", :foreign_key => "game_id", :dependent => :destroy
  has_many :categories, :through => :rounds
  has_many :clues, :through => :categories
  validates :date, :uniqueness => true, :presence => true
  validates :game_type, :presence => true

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

  def num_right
    num_right = self.clues.where(:right => true).count
  end

  def num_wrong
    num_wrong = self.clues.where(:wrong => true).count
  end

  def num_noresp
    num_noresp = self.clues.where(:no_resp => true).count
  end

  def score
    value_right = self.clues.where(:right => true).sum(:value)
    value_wrong = self.clues.where(:wrong => true).sum(:value)

    return value_right - value_wrong
  end

  def self.total_score
    self.all.map(&:score).sum
  end

  def self.average_score
    (self.all.map(&:score).sum)/(self.all.count)
  end

  def self.total_right
    self.all.map(&:num_right).sum
  end

  def self.total_wrong
    self.all.map(&:num_wrong).sum
  end

  def self.total_noresp
    self.all.map(&:num_noresp).sum
  end

  def self.average_numright
    (self.all.map(&:num_right).sum)/(self.all.count)
  end

  def self.average_numwrong
    (self.all.map(&:num_wrong).sum)/(self.all.count)
  end

  def self.average_numnoresp
    (self.all.map(&:num_noresp).sum)/(self.all.count)
  end

end

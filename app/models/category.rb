class Category < ActiveRecord::Base

  has_many :clues, :dependent => :destroy

  belongs_to :round , :class_name => "Round", :foreign_key => "round_id"

  after_create :add_clues

  # validates :theme, :presence => true

    def add_clues
    if self.round.category == "Final Jeopardy"
      clue = Clue.new
      clue.category_id = self.id
      clue.save
    else
      if self.round.category == "Jeopardy"
        values = { :min => 200, :max => 1000, :step => 200}
      else
        values = { :min => 400, :max => 2000, :step => 400}
      end

      (values[:min]..values[:max]).step(values[:step]) do |dollars|
        clue = Clue.new
        clue.category_id = self.id
        clue.value = dollars
        clue.save
      end
    end
  end

end

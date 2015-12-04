class Round < ActiveRecord::Base

  has_many :categories , :class_name => "Category" , :foreign_key => "round_id", :dependent => :destroy

  belongs_to :game , :class_name => "Game", :foreign_key => "game_id"

  after_create :add_categories

  def add_categories
    if self.category != "Final Jeopardy"
      6.times do
        category = Category.new
        category.round_id = self.id
        category.save
      end
    else
      category = Category.new
      category.round_id = self.id
      category.save
    end
  end

end

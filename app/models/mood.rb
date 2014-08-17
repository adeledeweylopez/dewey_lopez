class Mood < ActiveRecord::Base
	belongs_to :user
  validates :name,  presence: true, length: { maximum: 10 }
  validates :value, presence: true, :inclusion => { :in => 0..10 }
  validates :color, format: {with: /#[a-f\d]{6}\z/i }


  @colors = Hash.new('#000000')
  def self.init(id)
    Mood.where("user_id = ?",id).order("created_at").pluck(:name,:color).each do |name,color|
      @colors[name] = color
    end
  end
  
  def self.get_color(name)
    @colors[name]
  end

  def self.set_color(name,color)
    @colors[name] = color
  end

  def self.all_colors()
    @colors
  end

  def self.drop_whites()
    Mood.uniq.pluck(:name).reject { |name| get_color(name) == '#ffffff' }
  end

  def self.get_moods(name, id)
    if get_color(name) != '#ffffff'
      Mood.where("name = ? AND user_id = ?", 
        name, id).pluck(:created_at,:value, :notes).map { |date| 
          {:x => date[0].to_i*1000, :y => date[1].to_f, :note => date[2].to_s} }
    end
  end
end

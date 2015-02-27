class Role < ActiveRecord::Base
  belongs_to :play
  has_many :speeches
  has_many :lines, through: :speeches
  has_many :scenes, through: :speeches

  def longest_speech
    line_count = 0
    speeches.each do |speech|
      if speech.lines.count > line_count
        line_count = speech.lines.count
        @longest = speech
      end
    end
    if line_count > 0
      return @longest.lines.count
    else
      return 0
    end
  end

  def scenes_number
    scenes_uniq = scenes.uniq {|p| p.scene_id}
    scenes_uniq.count
  end

  def percentage_of_scenes

    ((scenes_number.to_f/play.scenes.count)*100).round(2)
  end

end

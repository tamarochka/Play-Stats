class Role < ActiveRecord::Base
  belongs_to :play
  has_many :speeches
  has_many :lines, through: :speeches

  def longest_speech
    line_count = 0
    self.speeches.each do |speech|
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

end

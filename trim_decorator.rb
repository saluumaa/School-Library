require './base_decorator'

class TrimDecorator < Decorator
  def correct_name
    @nameable.correct_name.strip
  end
end

require './base_decorator'

class TrimDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end

class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.last_name} #{object.first_name} 様 (マイページ準備中)"
  end
end

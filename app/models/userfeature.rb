class Userfeature < ApplicationRecord
  belongs_to :user
  enum activity: { high: 0, middle: 1, low: 2 }
  enum purpose: { increase: 0, maintain: 1, loss: 2 }

# カロリーやマクロ栄養素の計算式に関しては、以下のURLの”計算の解説”を参照
# https://dietgenius.jp/macro-nutrient-calculator/#1492304410953-fc2d4b82-8b8c
  def culculate_calorie_macro
    culculate_calorie()
    culculate_macro()
  end

  def culculate_calorie
    gender_num = self.user.gender == 'male' ? 5 : -161
    activity_val = activity_value()
    purpose_val =  purpose_value()
    basic_calorie = (10 * weight) + (6.25 * height) -
                    (5 * age) + gender_num
    self.total_calorie = basic_calorie * activity_val * purpose_val
  end

  def culculate_macro
    self.protein = weight * 2
    self.fat = total_calorie / (4 * 9)
    self.carbo = (total_calorie -
                     (protein * 4) - (fat * 9)) / 4
  end

  def activity_value
    case self.activity
    when 'low' then 1.2
    when 'middle' then 1.55
    when 'high' then 1.725
    else 1.2
    end
  end

  def purpose_value
    case self.purpose
    when 'loss' then 0.8
    when 'maintain' then 1
    when 'increase' then 1.2
    else 1.2
    end
  end
end

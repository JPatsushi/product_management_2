class TimeCard < ApplicationRecord
    belongs_to :user
    
    
  class << self
    # 今日のタイムカードを取得する
    def today(user)
      date = Date.today
      condition = { user: user, year: date.year, month: date.month, day: date.day }
      TimeCard.find_by(condition) || self.new(condition)
    end

    # 指定年月のタイムカードを取得する
    def monthly(user, year, month)
      TimeCard.where(user: user, year: year, month: month).order(:day).all
    end
  end
  
  
  
  
  
end
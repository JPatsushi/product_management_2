class TimeCard < ApplicationRecord
  belongs_to :user

  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validate :valid_date
  validates :in_at, presence: true, if: lambda { |m| !m.out_at.nil? }
  validate :out_at_is_later_than_in_at
  
  # attr_accessor :must_work_time, :sd_work_time

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

  # 勤務状況を取得する
  def working_status
    case [!!in_at, !!out_at]
    when [false, false]
      :not_arrived # 未出社
    when [true, false]
      :working # 勤務中
    when [true, true]
      :left # 退社済
    end
  end

  # タイムカードの日付を返す
  def date
    Date.new(year, month, day)
  end

  # 勤務時間（秒）を返す
  def work_hours
    if in_at && out_at
      out_at - in_at
    else
      0
    end
  end

  private

    # カスタムバリデーション（正しい日付か？）
    def valid_date
      if !positive_integer?(year) ||
        !positive_integer?(month) ||
        !positive_integer?(day) ||
        !Date.valid_date?(year, month, day)

        errors[:base] << '不正な日付です'
      end
    end

    # 正の整数か？
    def positive_integer?(value)
      !value.nil? && value.integer? && value > 0
    end

    # カスタムバリデーション（退社時間が出社時間より後か？）
    def out_at_is_later_than_in_at
      return if in_at.nil? || out_at.nil?

      if in_at > out_at
        errors[:base] << '退社時間は、出社時間より後の時間である必要があります'
      end
    end
end
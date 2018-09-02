module TimeCardsHelper
  # 日付の日本語表現を取得する
  def date_in_japanese(date = Date.today, format = :full)
    case format
    when :full
      "#{date.year}年#{date.month}月#{date.day}日 #{day_of_the_week_in_japanese(date)}"
    when :month_day
      "#{date.month}月#{date.day}日"
    end
  end

  # 曜日の日本語表現を取得する
  def day_of_the_week_in_japanese(date, format = :full)
    result =
      case date.wday
      when 0
        '日曜日'
      when 1
        '月曜日'
      when 2
        '火曜日'
      when 3
        '水曜日'
      when 4
        '木曜日'
      when 5
        '金曜日'
      when 6
        '土曜日'
      end

    format == :short ? result[0] : result
  end

  # 勤務状況を取得する
  def working_status(time_card)
    case time_card.working_status
    when :not_arrived
      '未出社'
    when :working
      '勤務中'
    when :left
      '退社済'
    end  
  end

  # 指定した年月の1日から月末までの日付とインデックスを引数としてブロックを実行する
  def each_date_in_month(year, month)
    date = Date.new(year, month, 1)

    while date.month == month do
      yield date, date.day - 1
      date = date.next_day
    end
  end

  # 00:00 形式の時間を返す
  def time_string(time)
    time ? time.strftime('%H:%M') : ''
  end

  # 00:00 形式の勤務時間を返す
  def work_hours(second)
    hours, rest = second.divmod(60 * 60)
    minutes, rest = rest.divmod(60)

    '%02d' % hours + ':' '%02d' % minutes
  end
end
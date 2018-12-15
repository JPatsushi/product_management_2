module DatetimeIntegratable
  extend ActiveSupport::Concern

  included do
    after_initialize :initialize_integrate_datetime
    before_validation :integrate_datetime

    def initialize_integrate_datetime
      self.class.datetime_integrate_targets.each do |attribute|
        next unless self.respond_to?("#{attribute}") #published_atが無ければ何もしない
        original_date = self.send("#{attribute}")
        next if original_date.nil? #最初の日と時間が無ければ何もしない
        [["date", "%Y/%m/%d"], ["hour", "%H"], ["minute", "%M"]].each do |key, format|
          next if self.send("#{attribute}_#{key}").present? #日と時間がそれぞれ無ければ何もしない
          self.send("#{attribute}_#{key}=", original_date.strftime(format))
        end
      end
    end

    def integrate_datetime
      self.class.datetime_integrate_targets.each do |attribute| #published_atを代入
        date = self.send("#{attribute}_date")
        hour = self.send("#{attribute}_hour")
        minute = self.send("#{attribute}_minute")
        if date.present? && hour.present? && minute.present?
          self.send("#{attribute}=", Time.zone.parse("#{date} #{hour}:#{minute}:00"))
        else
          self.send("#{attribute}=", nil) #published_atが無ければnilを代入
        end
      end
    rescue
      nil #エラーが発生したらnil出力
    end
  end

  module ClassMethods
    attr_accessor :datetime_integrate_targets

    def integrate_datetime_fields(*attributes) #publisher_atを三つに分解
      self.datetime_integrate_targets = attributes
      attributes.each do |attribute|
        self.send(:attr_accessor, "#{attribute}_date")
        self.send(:attr_accessor, "#{attribute}_hour")
        self.send(:attr_accessor, "#{attribute}_minute")
      end
    end
  end
end
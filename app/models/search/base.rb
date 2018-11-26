class Search::Base
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  def contains(arel_attribute, value)
    arel_attribute.matches("%#{escape_like(value)}%")
  end

  def escape_like(string)
    string.gsub(/[\\%_]/) { |m| "\\#{m}" }
  end

  def value_to_boolean(value)
    if ['1','true','t'].include?(value)
      true
    else
      nil
    end
  end
end
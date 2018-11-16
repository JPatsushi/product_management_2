class Form::Base
  include ActiveModel::Model

  def value_to_boolean(value)
    if ['1'].include?(value)
      true
    else
      nil
    end
  end
end
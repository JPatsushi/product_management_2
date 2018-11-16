class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  def value_to_boolean(value)
    if ['1'].include?(value)
      true
    else
      nil
    end
  end
end
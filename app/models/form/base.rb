class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  def value_to_boolean(value)
    
    
          if value.is_a?(String) && value.empty?
            nil
          else
            ['1'].include?(value)
          end
  end
    # ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value)
  
end
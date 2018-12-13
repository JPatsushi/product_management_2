class Person < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
end

module LogicalDeleteScopes
  extend ActiveSupport::Concern
  included do
    scope :without_deleted, lambda{ where(deleted_at: nil) }
  end 
end
 
module PublishStatusScopes
  extend ActiveSupport::Concern
  include LogicalDeleteScopes
  included do
    scope :published, lambda{ without_deleted.where(status: 'published') }
    scope :draft, lambda{ without_deleted.where(status: 'draft') }
  end 
end 
 
class Article < ApplicationRecord
  include PublishStatusScopes
end
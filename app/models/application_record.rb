class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user }
end

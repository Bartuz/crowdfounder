class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :amount
  validates_presence_of :user, :project
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
end

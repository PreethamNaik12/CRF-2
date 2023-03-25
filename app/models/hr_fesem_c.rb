class HrFesemC < ApplicationRecord
  has_many_attached :references
  belongs_to :user
     serialize :measuring
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table

end

class Tag < ActiveRecord::Base
  belongs_to :photo
  attr_accessible :height, :label, :left, :top, :width
  self.table_name = 'phototags'
end

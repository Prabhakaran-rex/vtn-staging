class Tag < ActiveRecord::Base
  belongs_to :photo
  attr_accessible :height, :label, :left, :top, :width
  set_table_name = :phototags
end

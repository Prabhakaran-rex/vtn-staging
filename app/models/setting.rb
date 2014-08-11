class Setting < ActiveRecord::Base
  attr_accessible :description, :key, :value
  
  def self.is_set(key,value)
    theKey = find_by_key(key)
    return true if theKey.nil?
    return theKey.value == value ? true : false
  end

  def self.get(key)
    theKey = find_by_key(key)
    return theKey.nil? ? "no-reply@valuethisnow.com" : theKey.value
  end
end

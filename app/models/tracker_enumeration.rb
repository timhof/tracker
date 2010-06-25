class TrackerEnumeration
	
  def TrackerEnumeration.add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end
  
  def TrackerEnumeration.const_missing(key)
    @hash[key]
  end   
  
  def TrackerEnumeration.each
    @hash.each {|key,value| yield(key,value)}
  end
  
  def TrackerEnumeration.values
    @hash.values || []
  end
  
  def TrackerEnumeration.keys
    @hash.keys || []
  end
  
  def TrackerEnumeration.[](key)
    @hash[key]
  end
  
end

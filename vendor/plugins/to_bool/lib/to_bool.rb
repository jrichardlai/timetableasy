# ToBool

class String
  def to_bool
    return true if self == true || self =~ /^true$/i
    return false if self == false || self.nil? || self =~ /^false$/i
    raise ArgumentError.new("invalid value for to_bool: \"#{self}\"")
  end
end

class Fixnum
  def to_bool
    return false if self == 0
    return true
  end
end

class Bignum
  def to_bool
    return false if self == 0
    return true
  end
end

class FalseClass
  def to_bool
    return false
  end
end

class TrueClass
  def to_bool
    return true
  end
end

class NilClass
  def to_bool
    return false
  end
end

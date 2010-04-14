class ActiveRecord::Base

  def self.or_scopes(scopes = [])
    # Cleanup input
    scopes.map! do |scope|
      scope = scope.respond_to?(:to_a) ? scope.to_a : [scope]
      scope.unshift(scope.shift.to_sym)
    end

    # Check for existence of scopes
    scopes.each{|scope| raise ArgumentError, "invalid scope: #{scope.first}" unless self.scopes.has_key?(scope.first) }

    conditions = scopes.map do |scope|
      scope = self.scopes[scope.first].call(self, *scope[1..-1])
      self.merge_conditions(scope.proxy_options[:conditions])
    end

    or_conditions = conditions.compact.join(" OR ")

    merged_scopes = scopes.inject(self){|merged, scope| merged.scopes[scope.first].call(self, *scope[1..-1]) }

    # We ignore other scope types but so does named_scopes
    find_options = merged_scopes.scope(:find).merge(:conditions => or_conditions)

    self.scoped(find_options)
  end

end
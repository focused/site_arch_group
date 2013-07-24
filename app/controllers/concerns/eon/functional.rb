module Eon::Functional
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def let(proc = nil, &block)
      y = (proc || block)
      y || raise('You must specify a Proc or &block.')
      y.arity < 2 && raise('You must define 2 arguments: function name and parameter.')

      define_method y.parameters[0][1] do |g = nil|
        -> x { g ? g.(y.(nil, x)) : y.(nil, x) }
      end
    end
  end
end

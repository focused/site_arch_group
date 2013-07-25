module Eon::Functional
  module Let
    def function(y = nil)
      y || raise('You must specify a Proc or &block.')
      y.arity < 2 && raise('You must define 2 arguments: function name and parameter.')

      [
        y.parameters[0][1],
        -> g = nil { -> x { g ? g.(y.(nil, x)) : y.(nil, x) } }
      ]
    end
  end

  include Let

  def self.included(base)
    base.extend(ClassMethods)
  end

  def let(proc = nil, &block)
    self.class.send :define_method, *function(proc || block)
  end

  module ClassMethods
    include Let

    def let(proc = nil, &block)
      define_method *function(proc || block)
    end

    def let_self(proc = nil, &block)
      define_singleton_method *function(proc || block)
    end
  end
end

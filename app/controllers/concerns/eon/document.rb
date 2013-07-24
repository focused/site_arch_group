module Eon::Document
  extend ActiveSupport::Concern

  def let(hash_or_proc)
    @processes = processes
  end

  # def lets(&block)
  #   instance_eval(&block)
  # end

  def draw
    Paper.new(@processes)
  end

  # def method_missing(m, *args, &block)
  #   @processes[m.to_sym] = *args
  # end

  included do
    helper_method :draw
  end

  class Paper
    def initialize(methods)
      define_method
    end
  end
end

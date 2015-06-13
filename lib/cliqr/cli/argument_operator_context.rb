# encoding: utf-8

module Cliqr
  module CLI
    # Context in which a anonymous argument operator runs
    #
    # @api private
    class ArgumentOperatorContext
      # Value to operator on
      #
      # @return [Object]
      attr_accessor :value

      # Create a argument operator context for a value
      def initialize(value)
        @value = value
      end
    end
  end
end
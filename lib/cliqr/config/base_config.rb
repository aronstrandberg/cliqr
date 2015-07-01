# encoding: utf-8

require 'cliqr/config/dsl'
require 'cliqr/config/validation/verifiable'

module Cliqr
  # A extension for CLI module to group all config classes
  #
  # @api private
  module Config
    # A value to initialize configuration attributes with
    UNSET = Object.new

    # Configuration option to enable arguments for a command (default)
    ENABLE_CONFIG = :enable

    # Configuration option to disable arguments for a command
    DISABLE_CONFIG = :disable

    # Option type for regular options
    ANY_ARGUMENT_TYPE = :any

    # Option type for numeric arguments
    NUMERIC_ARGUMENT_TYPE = :numeric

    # Option type for boolean arguments
    BOOLEAN_ARGUMENT_TYPE = :boolean

    # Default values based on argument type
    ARGUMENT_DEFAULTS = {
        NUMERIC_ARGUMENT_TYPE => 0,
        BOOLEAN_ARGUMENT_TYPE => false,
        ANY_ARGUMENT_TYPE => nil
    }

    # Get the passed param value if current attribute is unset
    #
    # @return [Object]
    def self.get_if_unset(attribute_value, default_value)
      attribute_value == UNSET ? default_value : attribute_value
    end

    # The base configuration setting to build a cli application with its own dsl
    class BaseConfig
      include Cliqr::Config::DSL
      include Cliqr::Config::Validation

      # Name of the config instance
      #
      # @return [String]
      attr_accessor :name
      validates :name,
                non_empty_format: /^[a-zA-Z0-9_\-]+$/

      # Description for the config instance
      #
      # @return [String]
      attr_accessor :description

      # New config instance with all attributes set as UNSET
      def initialize
        @name = UNSET
        @description = UNSET
      end

      # Finalize config by adding default values for unset values
      #
      # @return [Cliqr::Config::BaseConfig]
      def finalize
        @name = Config.get_if_unset(@name, '')
        @description = Config.get_if_unset(@description, '')

        self
      end

      # Check if a option's description is defined
      #
      # @return [Boolean] <tt>true</tt> if options' description is not null neither empty
      def description?
        !(@description.nil? || @description.empty?)
      end

      # Set value for an attribute
      #
      # @param [Symbol] name Name of the config parameter
      # @param [Object] value Value for the config parameter
      # @param [Proc] block Function which populates configuration for a sub-attribute
      #
      # @return [Object] new attribute's value
      def set_config(name, value, &block)
        value = block if block_given?
        handle_config(name, value)
      end

      private

      # Set value for an attribute by evaluating a block
      #
      # @param [Symbol] name Name of the config option
      # @param [Object] value Value for the config option
      #
      # @return [Object]
      def handle_config(name, value)
        public_send("#{name}=", value)
        value
      end
    end
  end
end

module Inch
  module CodeObject
    # CodeObject::Proxy object represent code objects in the analaysed
    # codebase.
    #
    module Proxy
      class << self
        # TODO:
        #
        # CodeObject::Proxy
        # |
        # +-- CodeObject::Ruby::ClassObject
        # |
        # +-- Evaluation::Ruby::ClassObject

        # Returns a Proxy object for the given +code_object+
        #
        # @param language [String,Symbol]
        # @param code_object [YARD::Object::Base]
        # @param object_lookup [Codebase::Objects]
        # @return [CodeObject::Proxy::Base]
        def for(language, code_object, object_lookup)
          attributes = Converter.to_hash(code_object)
          class_for(language, code_object).new(attributes, object_lookup)
        end

        private

        # Returns a Proxy class for the given +code_object+
        #
        # @param language [String,Symbol]
        # @param code_object [YARD::CodeObject]
        # @return [Class]
        def class_for(language, code_object)
          class_name = code_object.class.to_s.split("::").last
          const_get(class_name)
        end
      end
    end
  end
end

require "inch/code_object/proxy/base"
require "inch/code_object/proxy/namespace_object"
require "inch/code_object/proxy/class_object"
require "inch/code_object/proxy/class_variable_object"
require "inch/code_object/proxy/constant_object"
require "inch/code_object/proxy/method_object"
require "inch/code_object/proxy/method_parameter_object"
require "inch/code_object/proxy/module_object"

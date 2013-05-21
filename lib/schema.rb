module Designer

  require_relative './attributes'
  require_relative './graph'

  require 'active_support/core_ext/string/inflections'

  module Schema

    extend Attributes

    def attributes
      @attributes ||= []
    end

    def relations
      attributes.select { |attr| attr.is_a?(Attributes::Ref) || attr.is_a?(Attributes::Collection) }
    end

  end

  module DSL

    def add_attribute(attr)
      attributes << attr
    end

    def href(name)
      add_attribute Attributes::Href.new(name)
    end

    def string(name)
      add_attribute Attributes::Text.new(name)
    end

    def array(name)
      add_attribute Attributes::Arr.new(name)
    end

    def collection(name)
      add_attribute Attributes::Collection.new(name)
    end

    def timestamp(name)
      add_attribute Attributes::Timestamp.new(name)
    end

    def operation(name)
      add_attribute Attributes::Operation.new(name)
    end

    def ref(name)
      add_attribute Attributes::Ref.new(name)
    end

  end

end

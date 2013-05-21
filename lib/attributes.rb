module Designer
  module Attributes

    class Attribute

      attr_reader :name

      def initialize(name)
        @name = name.to_s
      end

      def to_s
        "%s[%s]" % [attr_klass, name]
      end

      def attr_klass
        self.class.name.split('::').last
      end

      def to_klass
        name.camelize
      end

    end

    class Ref < Attribute; end

    class Timestamp < Attribute; end

    class Href < Attribute

      def attr_klass
        'URL'
      end

    end

    class Collection < Attribute

      def to_s
        'Array[Ref[%s]]' % to_klass
      end

      def to_klass
        super.singularize
      end

    end

    class Text < Attribute

      def attr_klass
        'String'
      end

    end

    class Arr < Attribute

      def attr_klass
        'Array'
      end

    end


    class Operation < Attribute

      def attr_klass
        'Operation'
      end

    end

  end
end

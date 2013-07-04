module Serverspec
  module Type
    class Base
      def initialize(name=nil, opts=nil)
        @name = name
        @opts = opts
      end

      def to_s
        type = self.class.name.split(':')[-1]
        type.gsub!(/([a-z\d])([A-Z])/, '\1 \2')
        type.capitalize!
        %Q!#{type} "#{@name}"!
      end
    end
  end
end

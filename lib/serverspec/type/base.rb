module Serverspec
  module Type
    class Base
      def initialize(name=nil, opts=[])
        @name = name
        @opts = opts
      end

      def to_s
        type = self.class.name.split(':')[-1]
        type.gsub!(/([a-z\d])([A-Z])/, '\1 \2')
        type.capitalize!
        if @opts.size > 0
          %Q!#{type} "#{@name}, #{@opts.map(&:inspect).join(", ")}"!
        else
          %Q!#{type} "#{@name}"!
        end
      end
    end
  end
end

module Serverspec
  module Type
    class Port < Base
      def listening?
        backend.check_listening(@name, @opts)
      end
    end
  end
end

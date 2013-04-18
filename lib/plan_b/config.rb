module PlanB
  module Config
    class << self
      def authenticate_with &blk
        @authenticate = blk if blk
        @authenticate
      end
    end
  end
end
module Kaminari
  module MongoidCriteriaMethods
    extend ActiveSupport::Concern
    module InstanceMethods
      def limit_value #:nodoc:
        options[:limit]
      end

      def offset_value #:nodoc:
        options[:skip]
      end

      def total_count
        if self.klass.max_count_results
          limit(self.klass.max_count_results).count(true)
        else
          count
        end
      end
    end
  end
end

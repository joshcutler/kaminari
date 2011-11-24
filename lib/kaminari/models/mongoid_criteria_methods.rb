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

      def total_count #:nodoc:
        if self.klass.max_count_results
          limit(self.klass.max_count_results).count(true)
        else
          embedded? ? unpage.count : count
        end
      end

      private
      def unpage
        clone.tap do |crit|
          crit.options.delete :limit
          crit.options.delete :skip
        end
      end
    end
  end
end

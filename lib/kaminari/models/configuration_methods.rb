module Kaminari
  module ConfigurationMethods
    extend ActiveSupport::Concern
    module ClassMethods
      # Overrides the default per_page value per model
      #   class Article < ActiveRecord::Base
      #     paginates_per 10
      #   end
      def paginates_per(val)
        @_default_per_page = val
      end

      # This model's default per_page value
      # returns 25 unless explicitly overridden via <tt>paginates_per</tt>
      def default_per_page
        @_default_per_page || Kaminari::DEFAULT_PER_PAGE
      end
      
      # Adds a limiting method for Classes
      # class Article
      #   limit_max_count_results_to(10) #limits the most results returned to 100
      # end
      def limit_max_count_results_to(val)
        @_default_max_count_results = val
      end
      
      def max_count_results
        @_default_max_count_results
      end
    end
  end
end

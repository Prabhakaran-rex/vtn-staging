module ActiveRecord
  module CallbacksAwareSti
    extend ActiveSupport::Concern
    module ClassMethods
      def new(*args, &block)
        return super(*args, &block) unless args.first.respond_to?(:with_indifferent_access)
        type = args.first.with_indifferent_access[:type]
        if type.blank? or (type = type.constantize) == self
          super(*args, &block)
        else
          super(*args, &block).becomes(type)
        end
      end
    end
  end
end
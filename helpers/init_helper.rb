module InitHelper
  def self.included(base)
    class << base
      alias_method :_new, :new

      def new(params = {})
        _new(params).tap do |instance|
          instance.send(:after_init)
        end
      end
    end
  end
end

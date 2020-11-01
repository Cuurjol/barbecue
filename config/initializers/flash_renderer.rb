module ActionController
  module Flash
    def render(*args)
      options = args.last.is_a?(Hash) ? args.last : {}

      flash.now[:alert] = options.delete(:alert) if options[:alert]
      flash.now[:notice] = options.delete(:notice) if options[:notice]
      flash.update(options.delete(:flash)) if options[:flash]

      super(*args)
    end
  end
end

module XdomainRails
  class Engine < ::Rails::Engine
    isolate_namespace XdomainRails

    initializer "xdomain_rails.config" do |app|
      app.config.xdomain = XdomainRails.config
    end

    initializer "xdomain_rails.assets.precompile" do |app|
      app.config.assets.precompile += %w(xdomain.js)
    end

    initializer 'xdomain_rails.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper XdomainRails::XdomainHelper
      end
    end
  end
end

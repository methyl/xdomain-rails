module XdomainRails
  class XdomainController < ApplicationController
    after_action :allow_iframe

    layout false

    def proxy
      expires_in cache, public: true if cache
    end
    
    private

    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end

    def cache
      Rails.configuration.xdomain.cache
    end
  end
end

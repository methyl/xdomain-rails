module XdomainRails
  class XdomainController < ApplicationController
    after_filter :allow_iframe

    def proxy
      expires_in cache, public: true if cache

      render :proxy, layout: false
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

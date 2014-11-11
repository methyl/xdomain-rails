module XdomainRails
  class XdomainController < ApplicationController
    after_action :allow_iframe

    layout false

    def proxy
    end
    
    private

    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
  end
end

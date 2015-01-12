module XdomainRails
  module XdomainHelper
    def xdomain_masters(domains=nil)
      domains = (domains || master_domains).to_json.html_safe
      xdomain_script_tag + javascript_tag("xdomain.masters(#{domains})")
    end

    def xdomain_slaves(domains=nil)
      domains = (domains || slave_domains).to_json.html_safe
      xdomain_script_tag + javascript_tag("xdomain.slaves(#{domains})")
    end

    private

    def xdomain_script_tag
      javascript_tag(Rails.application.assets.find_asset("xdomain").source)
    end

    def configuration
      Rails.configuration.xdomain
    end

    def master_domains
      configuration.master_domains
    end

    def slave_domains
      configuration.slave_domains
    end
  end
end

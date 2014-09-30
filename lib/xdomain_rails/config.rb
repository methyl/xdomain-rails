require 'uri'

module XdomainRails
  class Config
    attr_reader :master_domains, :slave_domains
    attr_accessor :proxy_path

    def initialize
      self.proxy_path   = '/xdomain/proxy'
      self.master_domains = ENV["XDOMAIN_MASTERS"]
      self.slave_domains  = ENV["XDOMAIN_SLAVES"]
    end

    def master_domains=(domains)
      domains = parse_domains domains
      @master_domains = domains if domains.any?
    end

    def slave_domains=(domains)
      domains = domains_to_hash parse_domains(domains)
      @slave_domains = domains if domains.any?
    end

    private

    def parse_domains(domains)
      (domains.is_a?(String) ? JSON.parse(domains) : domains) || []
    end

    def domains_to_hash(domains)
      domains.inject({}) { |result, domain|
        path = URI(domain).path
        if path.present?
          result[domain.sub(path, '')] = path
        else
          result[domain] = proxy_path
        end
        result
      }
    end
  end
end

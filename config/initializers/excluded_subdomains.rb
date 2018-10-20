class ExcludedSubdomains
  EXCLUDED_SUBDOMAINS = %w[app public www]

  def self.include?(subdomain)
    EXCLUDED_SUBDOMAINS.include? subdomain
  end

end

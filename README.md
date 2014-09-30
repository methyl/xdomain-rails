# XDomain Rails

XDomain Rails is a gem which simplifies usage of
[XDomain](https://github.com/jpillora/xdomain) within Rails application.

## Installation

Add following line to your application's Gemfile:

    $ gem 'xdomain-rails'

And then execute:

    $ bundle

## Usage

The gem provides very simple API.

Consulting [XDomain README](https://github.com/jpillora/xdomain)
before using this gem is a good idea.

I highly recommend and assume that you are using
[dotenv-rails](https://github.com/bkeepers/dotenv).

Let's say we want to configure http://master.example.com
(the domain which you are making requests from) as master domain
and http://slave.example.com (which receives requests) as slave domain.

### Slave domain

Add following line to your routes:

```ruby
mount XdomainRails::Engine, at: '/xdomain'
```

Add following ENV variable to your .env:

```
XDOMAIN_MASTERS=http://master.example.com
```

Note: you can also limit scope, use wildcards and add few domains,
consult [configuration section](#configuration) for more informations:
```
XDOMAIN_MASTERS=*.example.com/api/*.json *.another.com
```

### Master domain

Add following line **before** any other Javascripts ([why?](https://github.com/jpillora/xdomain#quick-usage))
 to your main application layout:

```erb
<%= xdomain_slaves %>
```

Add following ENV variable:

```
XDOMAIN_SLAVES='["http://slave.example.com"]'
```

From now on, XHR requests will automagically work:

```javascript
$.get('http://slave.example.com/secret.json')
```

## Configuration

More sophisticated configuration is supported.

By default, gem will load domain configuration as JSON
from following ENV variables:

```
XDOMAIN_MASTERS='{"http://a.example.com": "*", "http://*.b.com": "api/*"}'
XDOMAIN_SLAVES='["http://first.example.com", "http://another.example.com/another/proxy"]'
```

As in XDomain, you can use wildcards in your master domains setup.

To change path for proxy, which by default is `/xdomain/proxy`
you can just add it in ENV variable:

```
XDOMAIN_SLAVES=http://slave.example.com/custom/proxy
```

If you don't like having configuration in ENV variables,
or you want to customize variable names, just create file
`config/initializers/xdomain_rails.rb` (**server restart required**):

```ruby
XdomainRails.configure do |config|
  # path to default xdomain proxy
  # default: '/xdomain/proxy'

  # config.proxy_path =

  # hash / json string with master domains
  # default: ENV['XDOMAIN_MASTERS']

  # config.master_domains =

  # array / json string of slave domains
  # default: ENV['XDOMAIN_SLAVES']

  # config.slave_domains =
end
```

### Helpers

Both `xdomain_slaves` and `xdomain_masters` helpers are available.

You can pass domains as an argument:

```erb
<%= xdomain_slaves ['http://slave.example.com'] %>
<%= xdomain_masters {'http://master.example.com': '/*.json'] %>
```

## Changelog

#### v1.0.0
  - first version
  - XDomain 0.6.15

## Tests

[WIP] :grinning:

## Contributing

- Fork it (http://github.com/methyl/xdomain-rails/fork)
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Add some feature')
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request

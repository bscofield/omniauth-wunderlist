# Omniauth::Wunderlist

Official Omniauth strategy for the Wunderlist OAuth2 API

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-wunderlist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-wunderlist

## Usage

With Sinatra

    use OmniAuth::Builder do
      provider :wunderlist, CLIENT_ID, CLIENT_SECRET
    end

With Rails

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :wunderlist, CLIENT_ID, CLIENT_SECRET
    end

## Contributing

1. Fork it ( http://github.com/bscofield/omniauth-wunderlist/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

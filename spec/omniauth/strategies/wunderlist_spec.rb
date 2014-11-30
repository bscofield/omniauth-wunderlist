require 'spec_helper'

describe OmniAuth::Strategies::Wunderlist do
  subject do
    OmniAuth::Strategies::Wunderlist.new({})
  end

  context "general" do
    it "should be called wunderlist" do
      subject.options.name.should eq('wunderlist')
    end
  end

  context "endpoints" do
    it "has correct site" do
      subject.options.client_options.site.should eq("https://a.wunderlist.com/api")
    end

    it "has correct authorize_url" do
      subject.options.client_options.authorize_url.should eq("https://www.wunderlist.com/oauth/authorize")
    end

    it "has correct token_url" do
      subject.options.client_options.token_url.should eq("https://www.wunderlist.com/oauth/access_token")
    end
  end
end

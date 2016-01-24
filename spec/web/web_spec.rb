require 'spec_helper'

describe server(property[:name]) do
  describe http('http://' + ENV['TARGET_HOST']) do
    it "responds as 'text/html'" do
      expect(response.headers['content-type']).to match(%r{^text/html})
    end
    it "responds as '200'" do
      expect(response.status).to be 200
    end
  end
end

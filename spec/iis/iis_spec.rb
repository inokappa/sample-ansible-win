require 'spec_helper'

describe port(80) do
  it { should be_listening }
end

describe iis_website('Default Web Site') do
  it{ should exist }
end

describe iis_website('Default Web Site') do
  it{ should be_enabled }
end

describe iis_website('Default Web Site') do
  it{ should be_running }
end

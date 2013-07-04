require 'spec_helper'

include Serverspec::Helper::Darwin

describe port(80) do
  it { should be_listening }
  its(:command) { should eq 'netstat -tunl | grep -- :80\\ ' }
end

describe port(80, :tcp) do
  it { should be_listening }
  its(:command) { should eq 'netstat -tunl | grep -- \\^tcp\\ .\\*:80\\ ' }
end

describe port('invalid') do
  it { should_not be_listening }
end

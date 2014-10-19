require 'serverspec'

set :backend, :exec

describe port(9081) do
  it { should be_listening }
end

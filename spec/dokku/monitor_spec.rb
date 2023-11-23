# frozen_string_literal: true

RSpec.describe Dokku::Monitor do
  it "has a version number" do
    expect(Dokku::Monitor::VERSION).not_to be nil
  end
end

require "dokku/monitor/apps"

module Dokku
  module Monitor
    RSpec.describe Apps do
      let(:apps) { described_class.new }
      example do
        portal = apps.find { |app| app.name == "portal" } 
        expect(portal).not_to be_nil

        expect(portal).to be_down

        portal.rebuild

        expect(portal).to be_up
      end
    end
  end
end

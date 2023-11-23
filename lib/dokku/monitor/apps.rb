require "dokku/monitor/application"

module Dokku
  module Monitor
    class Apps
      include Enumerable

      def each
        `dokku apps`.split.map(&:strip).each do |name|
          next unless name.match(/[:alnum]+/)
          yield Application.new(name)
        end
      end
    end
  end
end



class Application
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def up?
    ps_report["Running"] == "true"
  end

  def down? = !up?

  def rebuild
    `dokku ps:rebuild #{@name}`
  end

  def ps_report
    Hash[
      `dokku ps:report #{@name}`.lines.map do |line|
        match = line.match /^([^\:]+):(.+)/

        next unless match

        [match[1], match[2]].map(&:strip)
      end.compact
    ]
  end
end

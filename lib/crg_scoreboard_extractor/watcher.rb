require_relative 'bout'

class CrgScoreboardExtractor::Watcher
  def initialize(path)
    self.path = path
  end

  def every(interval)
    loop do
      before = Time.now
      yield Bout.new(File.open(path))
      until_interval = interval - (Time.now - before)
      sleep(until_interval) if interval > 0
    end
  end

  private

  attr_accessor :path
end

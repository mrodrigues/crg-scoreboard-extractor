class Clock < Struct.new(:time, :number, :running)
  def self.from_node(node)
    time = format_time(node.at_xpath('Time').content.to_i)
    number = node.at_xpath('Number').content
    running = node.at_xpath('Running').content == 'true'

    new(time, number, running)
  end

  def self.format_time(milliseconds)
    Time.at(milliseconds / 1000).strftime('%M:%S')
  end
end

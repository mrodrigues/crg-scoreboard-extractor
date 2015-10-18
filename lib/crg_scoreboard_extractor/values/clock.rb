class CrgScoreboardExtractor::Clock < Struct.new(:milliseconds, :number, :running)
  def self.from_node(node)
    milliseconds = node.at_xpath('Time').content.to_i
    number = node.at_xpath('Number').content
    running = node.at_xpath('Running').content == 'true'

    new(milliseconds, number, running)
  end
end

class CrgScoreboardExtractor::Position < Struct.new(:type, :name, :number)
  def self.from_node(node)
    type = node.attr('Id')
    name = node.at_xpath('Name').content
    number = node.at_xpath('Number').content

    new(type, name, number)
  end
end

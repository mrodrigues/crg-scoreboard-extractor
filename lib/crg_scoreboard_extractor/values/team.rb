require_relative 'position'

class CrgScoreboardExtractor::Team < Struct.new(:name, :logo_path, :score, :lead_jammer, :positions)
  def self.from_node(node)
    name = node.at_xpath('Name').content
    logo_path = node.at_xpath('Logo').content
    score = node.at_xpath('Score').content
    lead_jammer = node.at_xpath('LeadJammer').content == 'true'
    positions = node.xpath('Position').map do |position|
      CrgScoreboardExtractor::Position.from_node(position)
    end

    new(name, logo_path, score, lead_jammer, positions)
  end

  def jammer
    positions.detect { |position| position.type == 'Jammer' }
  end
end

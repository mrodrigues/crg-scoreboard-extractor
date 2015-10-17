require 'nokogiri'
require_relative 'values/clock'
require_relative 'values/team'

class CrgScoreboardExtractor::Bout
  def initialize(file)
    self.doc = Nokogiri::XML(file)
  end

  def jam
    CrgScoreboardExtractor::Clock.from_node(jam_node)
  end

  def period
    CrgScoreboardExtractor::Clock.from_node(period_node)
  end

  def team1
    CrgScoreboardExtractor::Team.from_node(team_node(1))
  end

  def team2
    CrgScoreboardExtractor::Team.from_node(team_node(2))
  end

  private

  attr_accessor :doc

  def jam_node
    doc.at_xpath('//Clock[@Id="Jam"]')
  end

  def period_node
    doc.at_xpath('//Clock[@Id="Period"]')
  end

  def team_node(id)
    doc.at_xpath("//Team[@Id=#{id}]")
  end
end

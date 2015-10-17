require 'minitest/autorun'
require 'crg_scoreboard_extractor'

class TestBout < Minitest::Test
  include CrgScoreboardExtractor

  def setup
    @bout = Bout.new(File.open('test/fixtures/scoreboard-0-now.xml'))
  end

  def test_jam
    jam = Clock.new('01:22', '1', true)
    assert_equal @bout.jam, jam
  end

  def test_period
    period = Clock.new('29:22', '2', true)
    assert_equal @bout.period, period
  end

  def test_team1
    positions = [
      Position.new("Blocker2", "", ""),
      Position.new("Jammer", "Moshzilla", "42"),
      Position.new("Blocker1", "", ""),
      Position.new("Pivot", "", ""),
      Position.new("Blocker3", "", "")
    ]
    team1 = Team.new("Sugar Loathe", "/images/teamlogo/sugar-loathe.jpg", "2", true, positions)
    assert_equal @bout.team1, team1
  end

  def test_team2
    positions = [
      Position.new("Blocker2", "", ""),
      Position.new("Jammer", "", ""),
      Position.new("Blocker1", "", ""),
      Position.new("Pivot", "", ""),
      Position.new("Blocker3", "", "")
    ]
    team2 = Team.new("Ladies of HellTown", "/images/teamlogo/loht.png", "1", false, positions)
    assert_equal @bout.team2, team2
  end
end

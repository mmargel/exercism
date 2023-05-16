=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
class Tournament

  HEADER = "Team                           | MP |  W |  D |  L |  P"

  class Team
    attr_reader :name
    attr_accessor :wins
    attr_accessor :losses
    attr_accessor :draws
    
    def initialize(name)
      @name = name
      @wins = 0
      @losses = 0
      @draws = 0
    end

    def points
      @wins * 3 + @draws * 1
    end

    def matches_played
      @wins + @losses + @draws
    end
  end

  class << self
    def tally(input)
      team_results = input
        .split("\n")
        .reduce({}) do |scoreboard, row|
          first, second, result = row.split(';')
          scoreboard[first] ||= Team.new(first)
          scoreboard[second] ||= Team.new(second)
          tally_result(scoreboard[first], scoreboard[second], result)
          scoreboard
        end
        .values
        .sort do |first, second|
          if first.points != second.points
            second.points <=> first.points
          else 
            first.name <=> second.name
          end
        end

      stringify_results(team_results)
    end

    private

    def tally_result(first, second, result)
      case result
      when 'win'
        first.wins += 1
        second.losses += 1
      when 'loss'
        first.losses += 1
        second.wins += 1
      when 'draw'
        first.draws += 1
        second.draws += 1
      end
    end

    def stringify_team_record(team)
      [
        team.name.ljust(30),
        stringify_num(team.matches_played),
        stringify_num(team.wins),
        stringify_num(team.draws),
        stringify_num(team.losses),
        stringify_num(team.points),
      ].join(' | ')
    end

    def stringify_num(num)
      num.to_s.rjust(2)
    end

    def stringify_results(team_results)
      [
        HEADER,
        *team_results.map { |team| stringify_team_record(team) },
        ''
      ].join("\n")
    end
  end
end
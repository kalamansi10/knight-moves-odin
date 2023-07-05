class Knight
    attr_accessor :position, :uul, :uur, :ull, :dll, :ddl, :ddr, :urr, :drr
    def initialize(position)
        @position = position
    end
    
end
class Board
    attr_accessor :start
    def knight_moves(position, destination)
        @start = Knight.new(position)
        possible_moves(@start, destination, ['start'], [64])
    end
    def possible_moves(node, destination, been_at, steps)
        position = node.position
        move = next_move(position)
        if position == destination || been_at.any?(position)
            if position == destination && [*been_at, position].length <= steps[0]
                steps[0] = [*been_at, position].length 
                p '-----------'
                p [*been_at, position, 'end']
                p [*been_at].length
            end
            return node
        end
        node.uul = possible_moves(Knight.new(move[:uul]), destination, [*been_at, position], steps) unless !move[:uul] || [*been_at, position].length > steps[0]
        node.uur = possible_moves(Knight.new(move[:uur]), destination, [*been_at, position], steps) unless !move[:uur] || [*been_at, position].length > steps[0]
        node.ull = possible_moves(Knight.new(move[:ull]), destination, [*been_at, position], steps) unless !move[:ull] || [*been_at, position].length > steps[0]
        node.dll = possible_moves(Knight.new(move[:dll]), destination, [*been_at, position], steps) unless !move[:dll] || [*been_at, position].length > steps[0]
        node.ddl = possible_moves(Knight.new(move[:ddl]), destination, [*been_at, position], steps) unless !move[:ddl] || [*been_at, position].length > steps[0]
        node.ddr = possible_moves(Knight.new(move[:ddr]), destination, [*been_at, position], steps) unless !move[:ddr] || [*been_at, position].length > steps[0]
        node.urr = possible_moves(Knight.new(move[:urr]), destination, [*been_at, position], steps) unless !move[:urr] || [*been_at, position].length > steps[0]
        node.drr = possible_moves(Knight.new(move[:drr]), destination, [*been_at, position], steps) unless !move[:drr] || [*been_at, position].length > steps[0]
        node
    end
        
    def next_move(position)
        uul = [position[0] + 2, position[1] - 1] unless position[0] > 6 || position[1] < 2
        uur = [position[0] + 2, position[1] + 1] unless position[0] > 6 || position[1] > 7 
        ull = [position[0] + 1, position[1] - 2] unless position[0] > 7 || position[1] < 3
        dll = [position[0] - 1, position[1] - 2] unless position[0] < 2 || position[1] < 3
        ddl = [position[0] - 2, position[1] - 1] unless position[0] < 3 || position[1] < 2
        ddr = [position[0] - 2, position[1] + 1] unless position[0] < 3 || position[1] > 7
        urr = [position[0] + 1, position[1] + 2] unless position[0] > 7 || position[1] > 6
        drr = [position[0] - 1, position[1] + 2] unless position[0] < 2 || position[1] > 6
        {uul:uul, uur:uur, ull:ull, dll:dll, ddl:ddl, ddr:ddr, urr:urr, drr:drr}
    end
end

game = Board.new
game.knight_moves([1, 1], [1, 8])


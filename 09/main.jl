function move_tail(head, tail)
  dx = head[1] - tail[1]
  dy = head[2] - tail[2]

  if abs(dx) < 2 && abs(dy) < 2
    return tail
  end

  [
    dx != 0 ? (tail[1] + (dx / abs(dx))) : tail[1],
    dy != 0 ? (tail[2] + (dy / abs(dy))) : tail[2]
  ]
end

directions = Dict("R" => [1, 0], "L" => [-1, 0], "U" => [0, 1], "D" => [0, -1])

function run(head, tails)
  visited = Set([])

  for line in readlines("input.txt")
    parts = split(line, " ")
    steps = parse(Int, parts[2])

    for _ in 1:steps
      head += directions[parts[1]]

      t = head
      for i in eachindex(tails)
        tails[i] = move_tail(t, tails[i])
        t = tails[i]
      end

      push!(visited, tails[end])
    end
  end

  visited
end

# Part 1
println(length(run([0, 0], [[0, 0]])))

# Part 2
println(length(run([0, 0], fill([0, 0], 9))))

function run(lines)
  read_index = 1
  X = 1
  signal_strengths = []
  wait = 0
  cache = 0
  cursor = 1
  cycle = 1

  while read_index <= length(lines)
    if wait == 0
      parts = split(lines[read_index], " ")
      if parts[1] == "noop"
        wait += 1
      else
        wait += 2
        cache = parse(Int, parts[2])
      end
      read_index += 1
    end

    print(cursor-1 ∈ [X-1, X, X+1] ? "#" : " ")

    if cursor % 40 == 0
      print("\n")
      cursor = 0
    end

    cursor += 1

    if cycle ∈ [20, 60, 100, 100, 140, 180, 220]
      push!(signal_strengths, X * cycle)
    end

    wait -= 1

    if cache != 0 && wait == 0
      X += cache
      cache = 0
    end

    cycle += 1
  end

  sum(signal_strengths)
end

lines = readlines("input.txt")
println(run(lines))

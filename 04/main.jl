function parse_pair(str)
  parse.(Int, split(str, "-"))
end

function pairs()
  map(readlines("input.txt")) do line
    parse_pair.(split(line, ","))
  end
end

println(length(filter(pairs()) do pair
  (pair[1][1] <= pair[2][1] && pair[1][2] >= pair[2][2]) ||
  (pair[1][1] >= pair[2][1] && pair[1][2] <= pair[2][2])
end))

println(length(filter(pairs()) do pair
  !isempty(range(pair[1][1], stop = pair[1][2]) ∩ range(pair[2][1], stop = pair[2][2]))
end))

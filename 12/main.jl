function read_grid()
  start = CartesianIndex(1, 1)
  target = CartesianIndex(1, 1)

  lines = readlines("input.txt")
  grid = ones(Int16, length(lines), length(first(lines)))

  for (y, line) in enumerate(lines)
    for (x, c) in enumerate(line)
      grid[y, x] = c == 'S' ? 1 : c == 'E' ? 26 : parse(Int, c, base = 36) - 9
      if c == 'S' start = CartesianIndex(y, x) end
      if c == 'E' target = CartesianIndex(y, x) end
    end
  end

  (grid, start, target, length(grid[1]) * length(grid))
end

function valid_neighbours(grid, current, visited)
  indices = map(idx -> current + idx, CartesianIndex.([(0, 1), (1, 0), (0, -1), (-1, 0)]))

  filter(idx ->
    checkbounds(Bool, grid, idx) &&
    grid[idx] <= grid[current] + 1 &&
    idx ∉ visited
  , indices)
end

function solve(grid, current, target)
  next = [(current, 0)]
  visited = Set()

  while !isempty(next)
    current, distance = pop!(next)
    if current in visited
      continue
    end
    push!(visited, current)
    if current == target
      return distance
    end

    for n in valid_neighbours(grid, current, visited)
      pushfirst!(next, (n, distance + 1))
    end
  end

  return typemax(Int16)
end

(grid, start, target, shortest) = read_grid()
println(minimum(solve(grid, start, target)))
println(minimum(map(idx -> solve(grid, idx, target), findall(grid .== 1))))

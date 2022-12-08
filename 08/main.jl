mutable struct Tree
  visible::Bool
  height::Int
  score::Int
end

function read_trees()
  map(readlines("input.txt")) do line
    map(h -> Tree(false, parse(Int, h), 0), split(line, ""))
  end
end

trees = read_trees()
size = length(trees)

for y = 1:size
  for x = 1:size
    tree = trees[y][x]

    if x == 1 || y == 1 || x == size || y == size
      tree.score = 0
      tree.visible = true
      continue
    end

    score_north = 0
    for y1 = y-1:-1:1
      score_north += 1
      if tree.height > trees[y1][x].height
        if y1 == 1
          tree.visible = true
        end
      else
        break
      end
    end

    score_south = 0
    for y1 = y+1:size
      score_south += 1
      if tree.height > trees[y1][x].height
        if y1 == size
          tree.visible = true
        end
      else
        break
      end
    end

    score_east = 0
    for x1 = x-1:-1:1
      score_east += 1

      if tree.height > trees[y][x1].height
        if x1 == 1
          tree.visible = true
        end
      else
        break
      end
    end

    score_west = 0
    for x1 = x+1:size
      score_west += 1

      if tree.height > trees[y][x1].height
        if x1 == size
          tree.visible = true
        end
      else
        break
      end
    end

    tree.score = score_north * score_south * score_east * score_west
  end
end

println(sum(map(t -> count(t -> t.visible, t), trees)))
println(maximum(map(t -> maximum(map(t -> t.score, t)), trees)))

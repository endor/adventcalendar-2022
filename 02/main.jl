import Pkg

Pkg.add("Match")

using Match

function part1(p1, p2)
  @match (p1, p2) begin
    ("A", "X") => 4
    ("A", "Y") => 8
    ("A", "Z") => 3
    ("B", "X") => 1
    ("B", "Y") => 5
    ("B", "Z") => 9
    ("C", "X") => 7
    ("C", "Y") => 2
    ("C", "Z") => 6
    _          => println("undefined")
  end
end

function part2(p1, p2)
  @match (p1, p2) begin
    ("A", "X") => 3
    ("A", "Y") => 4
    ("A", "Z") => 8
    ("B", "X") => 1
    ("B", "Y") => 5
    ("B", "Z") => 9
    ("C", "X") => 2
    ("C", "Y") => 6
    ("C", "Z") => 7
    _          => println("undefined")
  end
end

println(sum(map(readlines("input.txt")) do line
  parts = split(line, " ")
  part1(parts[1], parts[2])
end))

println(sum(map(readlines("input.txt")) do line
  parts = split(line, " ")
  part2(parts[1], parts[2])
end))

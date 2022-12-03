input = readchomp("input.txt")
elves = split.(split(input, "\n\n"), '\n')
calories = [sum(parse.(Int, snacks)) for snacks in elves]

println(maximum(calories))
println(sum(view(sort(calories, rev=true), 1:3, 1)))

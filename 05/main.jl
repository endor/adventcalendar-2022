function parse_stacks(input)
  stacks = []

  for line in split(input, "\n")
    pos = 1
    stack = 1

    while pos < length(line)
      if !isassigned(stacks, stack)
        push!(stacks, [])
      end

      if line[pos] == '['
        crate = line[pos+1]
        push!(stacks[stack], crate)
      end

      pos += 4
      stack += 1
    end
  end

  stacks
end

function parse_step(step)
  s = split(step, " ")
  parse.(Int, [s[2], s[4], s[6]])
end

function move1!(stacks, step)
  for _ in range(1, stop = step[1])
    crate = popfirst!(stacks[step[2]])
    pushfirst!(stacks[step[3]], crate)
  end
end

function move2!(stacks, step)
  crates = splice!(stacks[step[2]], 1:step[1])
  prepend!(stacks[step[3]], crates)
end

parts = split(readchomp("input.txt"), "\n\n")

stacks1 = parse_stacks(parts[1])
stacks2 = parse_stacks(parts[1])
for step in split(parts[2], "\n")
  step = parse_step(step)
  move1!(stacks1, step)
  move2!(stacks2, step)
end
println(String(map(s -> first(s), stacks1)))
println(String(map(s -> first(s), stacks2)))

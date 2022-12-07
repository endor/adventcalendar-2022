import Pkg

Pkg.add("DataStructures")

using DataStructures

directories = DataStructures.DefaultDict(0)
current_directory = []

for line in readlines("input.txt")
  if startswith(line, "\$ cd ")
    if endswith(line, "/")
      global current_directory = ["/"]
    elseif endswith(line, "..")
      pop!(current_directory)
    else
      push!(current_directory, last(split(line, " ")))
    end
  end

  if !startswith(line, "\$")
    parts = split(line, " ")
    if parts[1] != "dir"
      size = parse(Int, parts[1])
      for d in 1:length(current_directory)
        directories[current_directory[1:d]] += size
      end
    end
  end
end

println(sum(values(filter(p -> p[2] <= 100000, directories))))

free_up = 30000000 - (70000000 - directories[["/"]])
println(first(sort(collect(values(filter(p -> p[2] >= free_up, directories))))))

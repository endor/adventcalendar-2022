import Pkg

Pkg.add("DataStructures")

using DataStructures

function start_marker(filename, unique_characters)
  buffer = CircularBuffer(unique_characters)
  pos = 1

  open(filename) do f
    for c in readeach(f, Char)
      push!(buffer, c)

      if length(unique(buffer)) == unique_characters
        break
      end

      pos += 1
    end
  end

  pos
end

println(start_marker("input.txt", 4))
println(start_marker("input.txt", 14))


function line_to_item(line)
  len = trunc(Int, length(line) / 2)
  c1 = split(line, "")
  c2 = splice!(c1, (len+1):length(c1))
  first(c1 ∩ c2)
end

function item_to_priority(item)
  val = parse(Int, item, base = 36) - 9
  if isuppercase(item[1])
    val += 26
  end
  val
end

function lines_to_groups(lines)
  groups = []
  while !isempty(lines)
    push!(groups, splice!(lines, 1:3))
  end
  groups
end

println(sum(item_to_priority.(line_to_item.(readlines("input.txt")))))
println(sum(item_to_priority.(map(g -> first(g[1] ∩ g[2] ∩ g[3]), lines_to_groups(readlines("input.txt"))))))

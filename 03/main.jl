function line_to_item(line)
  len = length(line)
  first(line[1:len÷2] ∩ line[len÷2+1:end])
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

#!/usr/bin/env gawk -f
function trunc(name, max) {
  mid = max / 2
  if (length(name) < max)
    return name
  return substr(name, 1, mid) "..." substr(name, length(name) - 1 - mid, mid + 2)
}

NR == 1 { next }

{
  name = ""
  for (i = 11; i <= NF; i++)
    name = name sprintf("%s%s", $i, i == NF ? "" : " ")
  process[name] += $4
}

END {
  PROCINFO["sorted_in"] = "@val_num_desc"
  for (name in process) {
    printf "%s takes in total %.2f%%\n", trunc(name, 50), process[name]
    # only display top 5 processes
    if (++j == 5) break
  }
}

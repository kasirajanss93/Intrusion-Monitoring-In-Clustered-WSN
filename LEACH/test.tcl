set t 1
set d 4
set x 5
for {set i 0} {$i<$d} {incr i} {
set t [expr {([expr {($x)*($t)}])%(10)}]
}
puts "t:$t"

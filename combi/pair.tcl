package require sha1
set i 1
set j 7
set u 0
set i1 4
set j1 2
set u1 1
set q 2
set k 10
if {$u==$u1} {
puts "No Common key"
} else {
set i_i1 [expr {($i)-($i1)}]
puts "i_i1:$i_i1"
set j_j1 [expr {($j)-($j1)}]
puts "j_j1:$j_j1"
set sec [expr {($j_j1)*(4)}]
puts "sec:$sec"
#set m [expr int([expr rand() * $n])]
set sq [expr int([expr {($i_i1)*($i_i1)}])]
set sum [expr {($sq)+($sec)}]
puts "sum:$sum"
set y [expr {($sum)%($q)}]
puts "y:$y"
set sqr [expr { sqrt($y)}]
puts "ans:$sqr"
if {$sqr} {
set num [expr {($i_i1)+($sqr)}]
set num1 [expr int([expr {($num)/(2)}])]
set x1 [expr {($num1)%($q)}]
set numm [expr {($i_i1)-($sqr)}]
set numm1 [expr int([expr {($numm)/(2)}])]
set x2 [expr {($numm1)%($q)}]
puts "x1:$x1,x2:$x2"
if {($x1<$k)&&($x2<$k)} {
set xab [append ans $x1 $x2]
puts "xab:$xab"
set test [sha1::sha1 $xab]
puts "$test"

} else {
puts "No common key"
}
} else {
puts "No common key"
}


}
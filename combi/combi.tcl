
proc ran {} {
set X 6
set i [expr int([expr rand() * $X])]
set j [expr int([expr rand() * $X])]
set u [expr int([expr rand() * $X])]
set ans {}
lappend ans $i $j $u
return $ans
}

for {set i 0} {$i<50} {incr i} {
set fid [open txt/base.txt w]
set ans [ran]
puts $fid $ans
close $fid
}

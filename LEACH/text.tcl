proc gcd {a b} {
if {$b==0} {
return $a
} else {
set x [expr {($a)%($b)}]
return [gcd $b $x]
}
}
proc isprime {a} {
set con [expr {($a)/(2)}]
set flag 0
for {set i 2} {$i<$con} {incr i} {
if {$a%$i==0} { 
set flag 1
}
}
if { $flag==0 } { 
return 1
}
}

proc rsa {} {
set primep 0
while {$primep!=1 } {
set p [expr int([expr rand() * 1000])]
if {$p!=0&&$p!=1} {
set primep [isprime $p]
} 
}
#puts "p:$p"
set primeq 0
while {$primeq!=1 } {
set q [expr int([expr rand() * 1000])]
if {$q!=0&&$q!=1} {
set primeq [isprime $q]
}
}
#puts "q:$q"

set n [expr {$p*$q}]
set phi [expr {($p-1)*($q-1)}]
#puts "phi:$phi"

set ans 0
set primee 0
while {$ans!=1} {
while {$primee!=1 } {
set e [expr int([expr rand() * $phi])]
set primee [isprime $e] 
}

set ans [gcd $e $phi]
}
#puts "ans:$ans"
#puts "e:$e"
set d 1
set s 0
while {$s!=1} {
set de [expr {$d*$e}]
set s [expr {($de)%($phi)}]
set d [expr {$d+1}]
}
set d [expr {$d-1}]
#puts "d:$d"
#puts "e:$e"
set m [expr int([expr rand() * $n])]
#puts "m:$m"
set c 1
for {set i 0} {$i<$e} {incr i} {
set c [expr {([expr {($c)*($m)}])%($n)}]

}
set c [expr {$c%$n}]
#puts "c:$c"

set p 1
for {set i 0} {$i<$d} {incr i} {
set p [expr {([expr {($p)*($c)}])%($n)}]

}
set p [expr {$p%$n}]

#puts "p:$p"
set ans {}
lappend ans $m $e $c $n $phi
return $ans
}

set fid2 [open txt/base.txt w]

for {set i 0} {$i<50} {incr i} {
set fid [open txt/$i.txt w]
set ans [rsa]
#puts "message:$ans"
set count 0
set ec {}
foreach s_el $ans {
set count [expr {$count+1}]
if {$count==1} {
#puts $s_el
puts $fid $s_el
} elseif {$count==2} {
puts "2:$s_el"
lappend ec $s_el
} elseif {$count==3} {
puts "3:$s_el"
lappend ec $s_el
} elseif {$count==4} {
puts "4:$s_el"
lappend ec $s_el
} elseif {$count==5} {
puts "4:$s_el"
lappend ec $s_el
puts $fid2 $ec
}
}
#
#puts -nonewline "$e"
close $fid
}




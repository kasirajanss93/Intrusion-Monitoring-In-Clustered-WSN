proc decrypt {e phi c n} {
set d 1
set s 0
while {$s!=1} {
set de [expr {$d*$e}]
set s [expr {($de)%($phi)}]
set d [expr {$d+1}]
}
set d [expr {$d-1}]
set p 1
for {set i 0} {$i<$d} {incr i} {
set p [expr {([expr {($p)*($c)}])%($n)}]
}

set p [expr {$p%$n}]
return $p
}
proc sleach {num} {
set fid [open "txt/base.txt" r]
set file_data [read $fid]
set fid1 [open "txt/$num.txt" r]
set file_data1 [read $fid1]
set data [split $file_data "\n"]
set count 0
set e 0
set c 0
set n 0
set phi 0
foreach line $data {
	if {$count==$num} {
		puts "count:$count"
		puts $line
		set linec 0
		foreach s_el $line {
				set linec [expr {$linec+1}]
				if {$linec==1} {
				set e $s_el
				} elseif {$linec==2} {
				set c $s_el
				} elseif {$linec==3} {
				set n $s_el
				} elseif {$linec==4} {
				set phi $s_el
				}
			}
		}
set count [expr {$count+1}]
}
puts "e:$e"
puts "c:$c"
puts "n:$n"
puts "phi:$phi"
set pl [decrypt $e $phi $c $n]
puts "Plain text:$pl"
if {$pl==$file_data1} {
return 1
} else {
return 0
}
close $fid
close $fid1
}
set i 10
set val [sleach $i]
if {$val==1} {
puts "trusted node"
} else {
puts "attacker"
}



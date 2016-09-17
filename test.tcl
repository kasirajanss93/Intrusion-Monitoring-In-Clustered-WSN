#create a procedure
proc test{} {
 	set a 43
	set b 27
	set c [expr $a+$b]
	puts "c=$c"
}
#calling procedure
test

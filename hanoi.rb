################################################################################
# Tower of Hanoi Problem
# Ruby Learning Exercize
#
# by Jeremy D. McCarthy
# 2009/04/05
################################################################################

class Hanoi
	attr_accessor :numDisks, :a, :b, :c
	@count

	def initialize
		numDisks = 9
		@a = (1..numDisks).to_a.sort.reverse
		@b, @c = Array.new(numDisks), Array.new(numDisks)
	end

	def start
		@count = 0
		process()
	end
	
	def process(num = @a.length, from = @a, dest = @c, remain = @b)
		if(num == 1)
			dest.push(from.pop)
			system("clear") # linux specific
			@count += 1
			printPegs()
			sleep(1)
		else
			process(num-1, from, remain, dest)
			process(1, from, dest, remain)
			process(num-1, remain, dest, from)
		end
	end

	def printPegs
		print "A:]" + @a.to_s + "\n"
		print "B:]" + @b.to_s + "\n"
		print "C:]" + @c.to_s + "\n\n"
		puts "Number of operations: " + @count.to_s
	end
end

Hanoi.new.start

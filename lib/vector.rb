class Vector
	attr_accessor :angle, :length, :mode

	def initialize(x=1, y=0, mode = :deg)
		@mode = mode
		@angle = 0
		@length = 1

		set(x, y)
	end

	def copy
		Vector.new.set(x, y)
	end

	def turn(angle, mode=@mode)
		if mode == :rad
			angle = Vector.r2d angle
		end

		@angle +=angle
		self
	end

	def normalize
		@length = 1
	end

	def +(v)
		v.copy.add(x, y)
	end

	def -(v)
		v.copy.add(-x, -y)
	end

	def *(v)
		if v.class <= Vector
			# dot product, maybe should change
			@length * v.length * Math.cos(Vector.r2d(@angle - v.angle))
		else # scaling with a number
			scale(v)
		end
	end

	def add(x, y)
		set(self.x + x, self.y + y)
	end

	def add!(x, y)
		copy.add(x, y)
	end

	def scale(scalar)
		set(x*scalar, y*scalar)
	end

	def scale!(scalar)
		copy.scale(scalar)
	end

	def set(x, y)
		@length = Math.sqrt(x*x + y*y)
		@angle = Vector.r2d Math.atan2(y, x)
		self
	end

	def ratio
		(x / y).abs
	end

	def x
		@length * Math.cos(Vector.d2r(@angle))
	end

	def x=(newX)
		set newX, y
	end

	def y
		@length * Math.sin(Vector.d2r(@angle))
	end

	def y=(newY)
		set x, newY
	end


	def self.r2d(rad)
		rad * (180/Math::PI)
	end

	def self.d2r(deg)
		deg * (Math::PI/180)
	end
end
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

		@angle = Vector.constrain_angle(@angle + angle)
		self
	end

	def flipX
		set(-x, y)
	end

	def flipY
		set(x, -y)
	end

	def normalize
		@length = 1
	end

	def +(v)
		v.copy.add(x, y)
	end

	def -(v)
		v.copy.sub(x, y)
	end

	def *(scalar)
		scale(scalar)
	end

	def dot(v)
		@length * v.length * Math.cos(Vector.r2d(@angle - v.angle))
	end

	def angle_to(v)
		angle_to = angle - v.angle
		constrain_angle(angle_to, 180)
	end

	def add(x, y)
		copy.add!(x, y)
	end

	def add!(x, y)
		set(self.x + x, self.y + y)
	end

	def sub(x, y)
		copy.sub!(x, y)
	end

	def sub!(x, y)
		set(self.x - x, self.y - y)
	end

	def scale(scalar)
		copy.scale!(scalar)
	end

	def scale!(scalar)
		set(x*scalar, y*scalar)
	end

	def set(x, y)
		@length = Math.sqrt(x*x + y*y)
		@angle = (Vector.r2d Math.atan2(y, x)).round(14)
		self
	end

	def ratio
		(x / y).abs
	end

	def x
		(@length * Math.cos(Vector.d2r(@angle))).round(14)
	end

	def x=(newX)
		set newX, y
	end

	def y
		(@length * Math.sin(Vector.d2r(@angle))).round(14)
	end

	def y=(newY)
		set x, newY
	end


	def coerce(other)
		return self, other
	end

	def self.constrain_angle(angle, max=360)
		if angle < 0
			angle = Vector.constrain_angle(angle + max)
		elsif angle >= max
			angle = Vector.constrain_angle(angle - max)
		end

		angle
	end

	def self.r2d(rad)
		rad * (180/Math::PI)
	end

	def self.d2r(deg)
		deg * (Math::PI/180)
	end
end

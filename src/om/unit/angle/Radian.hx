package om.unit.angle;

import om.util.MathUtil.RADIANS_TO_DEGREES_FACTOR;

abstract Radian(Float) from Float to Float {

	public static inline var TURN = 6.28318530717959;
	public static inline var SYMBOL = "rad";

	public inline function new( i : Float ) this = i;

	public inline function abs() return Math.abs( this );
	public inline function min(f:Float) return Math.min( this, f );
	public inline function max(f:Float) return Math.max( this, f );
	public inline function sin() return Math.sin( this );
	public inline function cos() return Math.cos( this );

	public function normalize() : Radian {
		var a = this % TURN;
		return new Radian( a < 0 ? TURN + a : a );
	}

	public function normalizeDirection() : Radian {
		var a = normalize();
		return a > 180 ? a - TURN : a;
	}

	@:to public inline function toFloat() : Float return this;
	@:to public inline function toString() : String return this + SYMBOL;
	@:to public inline function toDegree() : Degree return this * RADIANS_TO_DEGREES_FACTOR;
	//@:to public inline function toBinaryDegree() : BinaryDegree return this * 40.7436654315252;

	@:op(-A)   public inline function negate() : Radian return -this;
	@:op(A+B)  public inline function add( r : Radian ) : Radian return this + r.toFloat();
	@:op(A-B)  public inline function subtract( r : Radian ) : Radian return this - r.toFloat();
	@:op(A*B)  public inline function multiply( f : Float ) : Radian return this * f;
	@:op(A/B)  public inline function divide( f : Float ) : Radian return this / f;
	@:op(A%B)  public inline function modulo( f : Float ) : Radian return this % f;
	@:op(A==B) public inline function equal( r : Radian ) : Bool return this == r;
	//public function nearEquals(other : Radian) : Bool return Floats.nearEquals(this, other.toFloat());
	@:op(A!=B) public inline function notEqual( r : Radian ) : Bool return this != r;
	@:op(A<B)  public inline function less( r : Radian ) : Bool return this < r.toFloat();
	@:op(A<=B) public inline function lessEqual( r : Radian ) : Bool return this <= r.toFloat();
	@:op( A>B) public inline function more( r : Radian ) : Bool return this > r.toFloat();
	@:op(A>=B) public inline function moreEqual( r : Radian ) : Bool return this >= r.toFloat();

	public inline static function pointToRadian( x : Float, y : Float ) : Degree
		return ( Math.atan2(y,x) : Radian );

	@:from public inline static function floatToRadian( f : Float ) : Radian
		return new Radian(f);
}

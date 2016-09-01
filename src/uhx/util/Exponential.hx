package uhx.util;

typedef Expo = Exponential;

class Exponential extends Strategy {
	
	private var _next:Float = 0;
	public var factor:Float = 2;
	
	public function new(?randomisation:Float = 0, ?factor:Float = 2) {
		super(randomisation);
	}
	
	override public function calculate(?delay:Float, ?retry:Float):Float {
		var result = retry+1 == 1 ? delay * (retry+1) : _next;
		_next = result * factor;
		return result;
	}
	
	override public function reset():Void {
		super.reset();
		_next = 0;
		factor = 2;
	}
	
}

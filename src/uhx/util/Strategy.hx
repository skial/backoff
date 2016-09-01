package uhx.util;

class Strategy {
	
	public var randomisation:Float;
	
	public function new(?randomisation:Float = 0) {
		this.randomisation = randomisation;
	}
	
	public function calculate(?delay:Float, ?retry:Float):Float {
		return delay * retry;
	}
	
	public inline function next(?delay:Float, ?retry:Float):Float {
		return calculate(delay, retry) * (1 + Math.random() * randomisation);
	}
	
	public function reset():Void {
		randomisation = 0;
	}
	
}

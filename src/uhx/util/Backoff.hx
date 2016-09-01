package uhx.util;

class Backoff {
	
	public var timeout:Float = 0;
	public var delay(default, null):Float;
	public var retries(default, null):Float;
	public var strategy(default, null):Strategy;
	
	private var currentRetry:Float = 0;
	
	public function new(strategy:Strategy, retries:Float, delay:Float) {
		this.strategy = strategy;
		this.retries = retries;
		this.delay = delay;
		
	}
	
	public function next():BackoffStatus {
		var result = strategy.next(this.delay, this.currentRetry);
		return { retry: currentRetry++, delay: timeout != 0 && result > timeout ? timeout : result };
	}
	
	public inline function hasNext():Bool {
		return currentRetry < retries;
	}
	
	public function reset():Void {
		retries = 0;
		delay = 0;
		strategy.reset();
	}
	
}

@:structInit class BackoffStatus {
	
	public var retry:Float;
	public var delay:Float;
	
}

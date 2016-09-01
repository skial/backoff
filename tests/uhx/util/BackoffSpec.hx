package uhx.util;

import utest.Assert;
import utest.Runner;
import utest.ui.Report;
import uhx.util.Exponential;

@:keep
class BackoffSpec {
	
	public static function main() {
		var runner = new Runner();
		runner.addCase(new BackoffSpec());
		Report.create(runner);
		runner.run();
	}
	
	public function new() {
		
	}
	
	public function testExponential() {
		var b = new Backoff( new Expo(), 10, 10 );
		b.timeout = 1000;
		var expected = [10, 20, 40, 80, 160, 320, 640, 1000, 1000, 1000];
		var actual = [for (ms in b) ms.delay];
		Assert.equals( '$expected', '$actual' );
	}
	
}

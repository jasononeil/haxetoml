import sys.io.File;
import haxetoml.*;

class SpeedTest {
	static function main() {
		var filename = Sys.args()[0];
		var numIterations = Std.parseInt(Sys.args()[1]);

		if (filename == null || numIterations == null)
			throw "Please use speedtest testfile numIterations, eg speedtest simple 1000";

		trace ('Loading the file $filename $numIterations times: ');
		timeTest(filename, numIterations, false);

		trace ('Parsing the file $filename $numIterations times: ');
		timeTest(filename, numIterations, true);
	}

	static function timeTest(filename, numIterations:Int, parseFile:Bool)
	{
		var start = Sys.time();
		for (i in 0...numIterations)
		{
			if (parseFile)
				var parsedToml = TomlParser.parseFile('resources/test_files/$filename.toml');
			else 
				var fileContent = sys.io.File.getContent('resources/test_files/$filename.toml');
		}
		var end = Sys.time();

		var timeTaken = end - start;
		trace ('  - Took $timeTaken seconds');
	}
}

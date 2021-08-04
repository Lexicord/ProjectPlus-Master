import openfl.Lib;
import flixel.FlxG;

class Data
{
	// totally not taken from kade engine like what?
    public static function initSave()
    {
        if (FlxG.save.data.hitsounds == null)
			FlxG.save.data.hitsounds = false;

		if (FlxG.save.data.Downscroll == null)
			FlxG.save.data.Downscroll = false;

		if (FlxG.save.data.fpsCap == null)
			FlxG.save.data.fpsCap = 120;

		if (FlxG.save.data.AntiA == null)
			FlxG.save.data.AntiA = true;
		
		if (FlxG.save.data.fpsCap > 285 || FlxG.save.data.fpsCap < 60)
			FlxG.save.data.fpsCap = 120; 

		Conductor.recalculateTimings();

		(cast (Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
	}
}
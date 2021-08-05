package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MenuButton extends FlxSprite
{
    public var animOffsets:Map<String, Array<Dynamic>>;

    var tex:FlxAtlasFrames;

    public function new(button:String, x:Float, y:Float)
    {
        super(x, y);

        animOffsets = new Map<String, Array<Dynamic>>();

        tex = Paths.getSparrowAtlas('FNF_main_menu_assets');
        frames = tex;

        animation.addByPrefix('idle', button + " basic", 24);
        animation.addByPrefix('selected', button + " white", 24);

        playAnim('idle');

        scrollFactor.set();
        antialiasing = true;
    }

    public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);

		if (animOffsets.exists(AnimName))
			offset.set(daOffset[0], daOffset[1]);
		else
			offset.set(0, 0);
	}

    public function addOffset(name:String, x:Float = 0, y:Float = 0)
    {
        animOffsets[name] = [x, y];
    }
}
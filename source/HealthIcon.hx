package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;

	var char:String = '';
	var isPlayer:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		this.isPlayer = isPlayer;

		changeIcon(char);
		scrollFactor.set();
	}

	var isOldIcon:Bool = false;

	public function toggleOldIcon():Void
	{
		isOldIcon = !isOldIcon;

		if (isOldIcon)
			changeIcon('bf-old');
		else
			changeIcon(PlayState.SONG.player1);
	}

	public function changeIcon(newChar:String):Void
	{
		if (newChar != char)
		{
			if (animation.getByName(newChar) == null)
			{
				frames = Paths.getSparrowAtlas('icons');

				animation.addByPrefix(newChar + '-normal', newChar + ' normal', 24, true, isPlayer);
				animation.addByPrefix(newChar + '-lose', newChar + ' losing', 24, true, isPlayer);

				animation.play(newChar + '-normal');
			}
			
			char = newChar;

			switch (newChar)
			{
				case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit':
					antialiasing = false;
				default:
					antialiasing = true;
			}
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
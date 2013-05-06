package  {
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * @author ieiomeli
	 */
	public class Robot extends FlxSprite{
		
		[Embed(source = 'Nivel3\\robot.png')] public static var sheet:Class;

		
		public function Robot()

		{
			
		super(250,420);
		loadGraphic(sheet, true, true,39, 38, true);

		//frame para que empiece con cierto frame
		//frame = 6;
		
		acceleration.y = 850;
		
		addAnimation("left", [0,1,2,3], 10, false);
		addAnimation("right", [4,5,6,7], 10, false);

		}
	}
}

package  {
	import org.flixel.FlxSprite;
	/**
	 * @author ieiomeli
	 */
	public class Perro extends FlxSprite{
		
		[Embed(source = 'arnoldo.png')] public static var sheet:Class;

		
		public function Perro()

		{
			

		super(250,420);
		loadGraphic(sheet, true, true,38, 26, true);

		//frame para que empiece con cierto frame
		//frame = 6;
		
		acceleration.y = 850;
		addAnimation("right", [0,1,2,3], 10, false);
		addAnimation("left", [4,5,6,7], 10, false);

		
		

		

		}
	}
}

package  {
	import org.flixel.FlxSprite;
	/**
	 * @author ieiomeli
	 */
	public class Jugador extends FlxSprite{
		
		[Embed(source = 'spritesheet.png')] public static var sheet:Class;

		
		public function Jugador()

		{
			

		super(0,410);
		loadGraphic(sheet, true, true,28, 42, true);

		//frame para que empiece con cierto frame
		//frame = 6;
		acceleration.y = 850;
		addAnimation("right", [0,1,2,3], 10, false);
		addAnimation("climb", [8,9,10,11], 10, false);
		addAnimation("left", [4,5,6,7], 10, false);

		
		

		

		}
	}
}

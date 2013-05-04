package  {
	import org.flixel.FlxSprite;
	/**
	 * @author ieiomeli
	 */
	public class Jugador extends FlxSprite{
		
		[Embed(source = 'PupaiWalking.png')] public static var jugadorSpriteSheet:Class;
		
		public function Jugador()

		{

		super(50,300);
		loadGraphic(jugadorSpriteSheet, true, true,23, 42, true);
		//frame para que empiece con cierto frame
		//frame = 6;
		
		
		
		addAnimation("taran", [1,2,3], 10, false);
		

		

		}
	}
}

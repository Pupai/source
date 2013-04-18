package  {
	import org.flixel.FlxSprite;
	/**
	 * @author ieiomeli
	 */
	public class Jefe extends FlxSprite{
		
		[Embed(source = "Nivel 1\\boss1.png")] public static var bossLevel1:Class;

		
		public function Jefe()

		{
			

		super(0,410);
		loadGraphic(bossLevel1, true, true,60, 90, true);

		//frame para que empiece con cierto frame
		//frame = 6;
		
		acceleration.y = 850;
		addAnimation("right", [0,1], 10, false);
		addAnimation("runright", [2,3], 10, false);
		addAnimation("attackright", [4,5], 10, false);
		addAnimation("left", [6,7], 10, false);
		addAnimation("runleft", [8,9], 10, false);
		addAnimation("attackleft", [10,11], 10, false);


		
		

		

		}
	}
}

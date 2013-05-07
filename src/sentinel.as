package {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	public class sentinel extends FlxSprite {
				[Embed(source = "Nivel3\\sentinel.png")] public static var bossLevel2:Class;
		
		public function sentinel(){
			health=100;
			
			
			super();
			
			loadGraphic(bossLevel2, true, true,97, 180, true);
			
			addAnimation("left", [0,1,2,3,4], 5, false);
			addAnimation("right", [5,6,7,8,9], 5, false);
			
			
			
		}
		
		
	}
	
}

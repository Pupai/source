package {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	public class sentinel extends FlxSprite {
				[Embed(source = "boss\\nave.png")] public static var bossLevel2:Class;
		
		public function sentinel(){
			health=100;
			
			
			super();
			
			loadGraphic(bossLevel2, true, true,80, 107, true);
			
			addAnimation("anima", [0,1,2,3], 5, false);
			
			
			
		}
		
		
	}
	
}

package  {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	
	public class Jefe extends FlxSprite{
		 	
		
		[Embed(source = "Nivel 1\\boss1.png")] public static var bossLevel1:Class;
		
		var bullet:Globo;
		var bullets:FlxGroup;
		public function Jefe()

		{
			super(0,200);
			health=40;

			
			

		
		loadGraphic(bossLevel1, true, true,67, 90, true);

		//frame para que empiece con cierto frame
		//frame = 6;
		
		acceleration.y = 850;
		addAnimation("right", [0,1], 10, false);
		addAnimation("runright", [2,3], 10, true);
		addAnimation("attackright", [4,5], 10, false);
		addAnimation("left", [6,7], 10, false);
		addAnimation("runleft", [8,9], 10, false);
		addAnimation("attackleft", [10,11], 10, false);
		addAnimation("hurtright", [0,12,13], 10, false);
		addAnimation("hurtrleft", [6,14,15], 10, false);
	
	
		}
		public function shoot(state:Boolean, dir:String):void {
			if(state){
				play(dir);
					
			}
		}
		public function move(dir:String):void {
			
			if(dir=="right"){
				this.x++;	
				play(dir);			
			}
			else if(dir=="left"){
				play(dir);
				this.x--;	
			}
			else if(dir=="runright"){
				play(dir);
				this.x+=3;
			}
			else if(dir=="runleft"){
				play(dir);
				this.x-=3;
			}
			else if (dir=="stop"){
				this.x+=0;
			}
			
		}
	}
}

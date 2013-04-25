package  {
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * @author ieiomeli
	 */
	public class Jugador extends FlxSprite{
		
		[Embed(source = 'spritesheet.png')] public static var sheet:Class;
		
		var bandera:Boolean = false;
		
		public function Jugador()

		{

		super(0,410);
		loadGraphic(sheet, true, true,28, 42, true);

		//frame para que empiece con cierto frame
		//frame = 6;
		health = 80;
		acceleration.y = 850;
		
		addAnimation("right", [0,1,2,3], 10, false);
		addAnimation("climb", [8,9,10,11], 10, false);
		addAnimation("left", [4,5,6,7], 10, false);
	

		}
		
		public function pelea(a:Perro){
			if(this.y+26<a.y){
				trace(this.y,a.y);
				a.kill();
				
			}
			else{
				this.hurt(20);
				this.bandera=true;
				
				trace("en player "+this.bandera);
				if(this.facing == FlxObject.RIGHT){
					trace("derecha");
					this.x-=20;
					this.y-=20;			
				}
				if(this.facing == FlxObject.LEFT){
					trace("izquierda");	
					this.x+=20;
					this.y-=20;		
				}
			}
		
		}
	}
}

package {
	import org.flixel.FlxSprite;
	/**
	 * 
	 * @author Jahel
	 */
	public class Globo extends FlxSprite{
		
		public function Globo(){
			this.x=10;
			this.y=20;
			this.acceleration.y=0;
			this.velocity.x=300;
			this.exists = false;
			makeGraphic(5, 5);
			
		}
		override public function update():void{
			super.update();
			if(this.x > 800){
				this.exists = false;
			}
		}

	}
}

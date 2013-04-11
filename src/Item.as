package {
	import org.flixel.FlxSprite;
	/**
	 * 
	 * @author Jahel
	 */
	public class Item extends FlxSprite{
		
		public function Item(str:String, width:Number, height:Number, x:Number, y:Number){
			super(x,y);
			if(str=="visores"){
				[Embed(source = 'visores.png')] var vsheet:Class;
				loadGraphic(vsheet, true, true,width, height, true);
				addAnimation("move", [0,1], 10, false);
			}
			else if(str=="crate"){
				[Embed(source = "Tutorial\\crate.png")] var Img:Class;
				loadGraphic(Img, true, true,width, height, true);
			}
			
		}

	}
}

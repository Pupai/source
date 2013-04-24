package {
	import org.flixel.FlxGroup;
	
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import flash.events.MouseEvent;
	/**
	 * 
	 * @author Jahel
	 */
	public class Estado extends FlxState{
		
		private var ballon:Globo;
		private var globiza:FlxGroup;
		
		
		public function Estado(){
			
			globiza = new FlxGroup();
			for(var i:Number=0; i<10 ; i++){
				ballon = new Globo();
				globiza.add(ballon);
			}
			add(globiza);
			
			
		}
		override public function update():void{
			super.update();
			if(FlxG.mouse.justPressed()){
				ballon=Globo(globiza.getFirstAvailable());
				ballon.x= FlxG.mouse.x;
				ballon.y= FlxG.mouse.y;
				ballon.exists=true;
				
				
			}
		}

	}
}

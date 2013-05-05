
 package
{
		import flash.display.*;
		import org.flixel.*;
		import flash.events.*;
    public class AnimationState extends FlxState
    {
        [Embed(source="Bienvenida.swf")]private static var Animacion:Class;
        private var noFrames:Number = 200;
    
        private var animacion:MovieClip;
        
        override public function create():void {
            animacion = new Animacion();
       
            
     FlxG.stage.addChildAt(animacion, 1);    
        
           animacion.addEventListener(Event.EXIT_FRAME, queHacer);
        }
        
        private function cargar(e:Event):void {
            
            FlxG.stage.addChildAt(animacion, 1);
            animacion.addEventListener(Event.EXIT_FRAME, queHacer);
        }
        
        private function queHacer(e:Event):void {
            noFrames--;
            if (noFrames <= 0) {
                FlxG.stage.removeChildAt(1);
               animacion.removeEventListener(Event.EXIT_FRAME, queHacer);
			   			FlxG.switchState(new Tutorial());
			   
            
                //FlxG.flashFramerate = 60;
            
                
            }
        }
        
        
        

        
    }
} 
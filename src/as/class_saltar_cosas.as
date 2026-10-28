import mx.transitions.Tween;
import mx.transitions.easing.*;

class class_saltar_cosas extends MovieClip {
	
	public var bueno:Boolean = true;
	public var libre:Boolean = true;
	public var origX:Number=0;
	public var destX:Number=0;
	public var tween:mx.transitions.Tween;
	
	public function class_caer_cosas() {
	}	
	
	public function _onPress() {
		if (_parent.jugando) {
			if (this.bueno) {
				//cortar tween
				this.tween.fforward();		
				_parent.aciertos++;
				_parent.ninos.bocadillo.gotoAndPlay("bien");				
				_parent.SumarPuntos();
			} else {
				_parent.vidas--;
				_parent.ninos.bocadillo.gotoAndPlay("mal");
			}
		}
	}
	
	public function onEnterFrame() {
		if (!this.libre && !_parent.ninos.bloqueado) {
			var coor:Object = new Object();
			coor.x=_parent.ninos._x; coor.y=_parent.ninos._y;
			var coorthis:Object = new Object();
			coorthis.x=this._x; coorthis.y=this._y;
			
			if (distance(coorthis,coor)<25) {
				this._onPress();
			}
		}
	}
	
	public function distance(p1,p2) {
		var dx:Number;
		var dy:Number;
		var dd:Number;
		dx=p1.x-p2.x;
		dy=p1.y-p2.y;
		dd=Math.sqrt((dx*dx)+(dy*dy));
	    return dd;
	}
}
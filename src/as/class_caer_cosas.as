import mx.transitions.Tween;
import mx.transitions.easing.*;

class class_caer_cosas extends MovieClip {
	
	public var bueno:Boolean = true;
	public var libre:Boolean = true;
	public var origY:Number=0;
	public var destY:Number=0;
	public var tween:mx.transitions.Tween;
	
	public function class_caer_cosas() {
	}	
	
	public function _onPress() {
		if (_parent.jugando) {
			//cortar tween
			this.tween.fforward();
			if (this.bueno) {
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
			if (this.hitTest(_parent.ninos)) {
				this._onPress();
			}
		}
	}
	
}
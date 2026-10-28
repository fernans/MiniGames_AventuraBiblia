import mx.transitions.Tween;
import mx.transitions.easing.*;

class class_ficha_letras extends MovieClip {
	public var valor:Number = 5;
	public var origX:Number = this._x;
	public var origY:Number = this._y;
	public var fija:Boolean=true;	
	public var dragin:Boolean=false;
	public var destino:Boolean=false;
	
	private var s:Sound;
	
	public function class_ficha_letras() {
			s=new Sound(this);
	}
	
	public function onRollOver() {
		if (!this.fija) {
			s.attachSound("s_OVER");
			s.start();
		}
	}
	
	public function onPress() {
		if (_parent.jugando && !this.fija) {
			this.startDrag(true);
			this.swapDepths(_parent.onTop);
			dragin=true;
			s.attachSound("s_DRAG");
			s.start();
		}		
	}
	
	public function onRelease() {
		if (_parent.jugando && !this.fija) {
			var t:MovieClip=eval(this._droptarget);
			t=t._parent;
			this.swapDepths(_parent.onTop);		
			stopDrag();
			if (t.valor==this.valor && t.destino) {	//ACERTAR
				this.filters=new Array();		
				this._x=t._x;
				this._y=t._y;
				this.fija=true;
				_parent.SumarPuntos();
				_parent.aciertos++;
				s.attachSound("s_WIN");
				s.start();				
			} else { // FALLO
				new Tween(this, "_x", Back.easeOut, this._x, this.origX, 6, false);
				new Tween(this, "_y", Back.easeOut, this._y, this.origY, 6, false);
				s.attachSound("s_WRONG");
				s.start();				
			}	
		}
	}
}
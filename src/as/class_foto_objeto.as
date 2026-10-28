import mx.transitions.Tween;
import mx.transitions.easing.*;

class class_foto_objeto extends MovieClip {
	
	public var libre:Boolean = true;
	public var origX:Number;
	public var origY:Number;
	
	private var s:Sound;
	
	public function class_foto_objeto() {
		s=new Sound(this);
	}	
	
	public function onRollOver() {
			s.attachSound("s_OVER");
			s.start();
	}
	
	public function onPress() {
		origX=this._x;
		origY=this._y;
		this.startDrag(true);
		s.attachSound("s_DRAG");
		s.start();
	}

	public function onRelease() {
  		this.stopDrag();
		var canvas = this._parent._parent.canvas;		
		var fondo = this._parent._parent.fondo;				
		var x,y:Number;
		x=_root._xmouse-canvas._x-canvas._parent._x;
		y=_root._ymouse-canvas._y-canvas._parent._y;
		canvas.ultimo=this;
		
		if (this._parent.name==menu && this.libre) {
			if (x>0 && x<fondo._width && y>0 && y<fondo._height) {			
				//crear uno nuevo
				var t:MovieClip;
				t=canvas.attachMovie(this._name,this._name+"_"+canvas.getNextHighestDepth(),canvas.getNextHighestDepth());
				t.libre=false;
				t._x=x;
				t._y=y;			
				canvas.ultimo=t;
			}
			this._x=origX;
			this._y=origY;
		} else {
			if (x<0 || x>fondo._width || y<0 || y>fondo._height) {
				//eliminar
				s.attachSound("s_WRONG");
				s.start();				
				removeMovieClip(this);
			}
		}

		s.attachSound("s_OK");
		s.start();
	}
}
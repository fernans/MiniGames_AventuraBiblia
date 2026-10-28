import flash.geom.Point;

class class_sueloLiso_giroball extends MovieClip {
	public var aceleracionX:Number;
	public var aceleracionY:Number;
	
	public function	class_sueloLiso_giroball() {
		aceleracionX=0;
		aceleracionY=0;
	}
	
	public function onEnterFrame() {
		var tMus=_parent._parent.mus;
		var coord:Point = new Point(tMus._x,tMus._y);
		tMus._parent.localToGlobal(coord);
		if (this.hitTest(coord.x,coord.y,true)) {
			_parent._parent.mus.aceleracionX=this.aceleracionX;
			_parent._parent.mus.aceleracionY=this.aceleracionY;			
		}
	}
	
}
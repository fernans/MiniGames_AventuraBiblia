import flash.geom.Point;

class class_sueloDerecha_giroball extends MovieClip {
	public var aceleracionX:Number;
	public var aceleracionY:Number;
	
	public function	class_sueloDerecha_giroball() {
		aceleracionX=0.2;
		aceleracionY=0.2;
	}
	
	public function onEnterFrame() {
		var tMus=_parent._parent.mus;
		var coord:Point = new Point(tMus._x,tMus._y);
		tMus._parent.localToGlobal(coord);
		if (this.hitTest(coord.x,coord.y,true)) {
			tMus.aceleracionX=this.aceleracionX;
			tMus.aceleracionY=this.aceleracionY;
		}
	}
	
}
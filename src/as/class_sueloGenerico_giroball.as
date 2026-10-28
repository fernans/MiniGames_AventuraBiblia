import flash.geom.Point;

class class_sueloGenerico_giroball extends MovieClip {
	public var aceleracionX:Number;
	public var aceleracionY:Number;
	public var multiplicadorX:Number;
	public var multiplicadorY:Number;
	
	public function	class_sueloGenerico_giroball() {
		aceleracionX=0.2*multiplicadorX;
		aceleracionY=0.2*multiplicadorY;
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
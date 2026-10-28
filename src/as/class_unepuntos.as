import flash.geom.Point;

class class_unepuntos extends MovieClip {
	
	public var marcado:Boolean;
	public var dibujaLinea:Boolean;
	public var valor:Number;
	
	private var s:Sound;
	
	public function class_unepuntos() {
		marcado=false;
		dibujaLinea=false;
		s=new Sound(this);
	}
	
	public function onRollOver() {
		s.attachSound("s_OVER");
		s.start();
	}
	
	public function onPress() {
		if (_parent._parent.jugando && !this.marcado && (this.valor==(_parent.aciertos+1))) {
			this.clear();
			this.dibujaLinea=true;
			this.swapDepths(_parent.cursor);
			_parent.cursor.startDrag(true);
			s.attachSound("s_DRAG");
			s.start();
		}
	}
	
	public function onRelease() {
		//sobre nadie
		this.swapDepths(_parent.cursor);		
		this.clear();
		this.dibujaLinea=false;
		s.attachSound("s_WRONG");
		s.start();
	}
	public function onReleaseOutside() {
		if (_parent._parent.jugando && this.dibujaLinea) {
			//sobre alguien
			var t:class_unepuntos=eval(this._parent.cursor._droptarget);						
			if (t!=undefined) {
				// comprobar si se acierta
				if (t.valor==(this.valor+1) || (t.valor==1 && this.valor==_parent.acertar)) {
					_parent.aciertos++;
					this.marcado=true;
					s.attachSound("s_OK");
				} else {
					s.attachSound("s_WRONG");
				}
			}
			s.start();
			if (this.marcado) {
				//dibujar la linea en el canvas
				this._parent.canvas.lineStyle(5,0x000000);
				var point:Point = new Point(this._x,this._y);
				point.x+=this._parent._parent._x;
				point.y+=this._parent._parent._y;
				this._parent.canvas.globalToLocal(point);
				this._parent.canvas.moveTo(point.x,point.y);
				point = new Point(t._x,t._y);
				point.x+=this._parent._parent._x;
				point.y+=this._parent._parent._y;				
				this._parent.canvas.globalToLocal(point);
				this._parent.canvas.lineTo(point.x,point.y);
			}
			//borrar la linea de este punto
			this.swapDepths(_parent.cursor);		
			this.clear();
			this.dibujaLinea=false;
		}
	}
	
	public function onMouseMove() {
		if (this.dibujaLinea) {
			this.clear();			
			this.lineStyle(5,0x000000);
			this.moveTo(0,0);
			this.lineTo(_xmouse,_ymouse);
		}
	}
}
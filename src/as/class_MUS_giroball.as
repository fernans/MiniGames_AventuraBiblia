class class_MUS_giroball extends MovieClip {

	public var haciaLado:Number;
	public var velocidadAndar:Number;
	public var velocidadX:Number;
	public var velocidadY:Number;	
	public var velocidadMaxX:Number;
	public var velocidadMinX:Number;	
	public var velocidadMaxY:Number;
	public var velocidadMinY:Number;	
	public var aceleracionX:Number;
	public var aceleracionY:Number;
	public var margenW:Number;
	public var margenH:Number;
	public var bordeW:Number;
	public var bordeH:Number;	
	
	public var origX:Number;
	public var origY:Number;
	
	public function class_MUS_giroball() {
		origX=_x;
		origY=_y;
		
		velocidadAndar=2;
		velocidadMaxX=velocidadAndar*5;
		velocidadMinX=-velocidadAndar*5;
		velocidadMaxY=velocidadAndar*5;
		velocidadMinY=-velocidadAndar*5;

		//distancia al borde de la orilla
		margenW=200; margenH=150;
		//tamaño de la ventana de vision
		bordeW=720;	bordeH=400;		
		
		iniciar();
		Key.addListener(this);
	}
	
	public function iniciar() {
		haciaLado=1; //derecha
		velocidadX=0;
		velocidadY=0;
		aceleracionX=0;
		aceleracionY=0;
		gotoAndStop("stop_right");

		_x=_parent.inicio._x;
		_y=_parent.inicio._y;
	}
	
	public function onEnterFrame() {
		// comprobar si... sobre pista
		if (_parent._parent.jugando) {
			if (not _parent.chocar.hitTest(this._x+_parent._x+_parent._parent._x,this._y+_parent._y+_parent._parent._y,true)) {
				_parent._parent.jugando=false;
				this.gotoAndStop("caer");
				_parent._parent.gotoAndPlay("perder");
			}
		}
		// comprobar si... sobre salida
		if (_parent._parent.jugando && this.hitTest(_parent.salida)) {
			if (Math.abs(this._x-_parent.salida._x)<(_parent.salida._width/4) && Math.abs(this._y-_parent.salida._y)<(_parent.salida._height/4)) {
				velocidadX=0; velocidadY=0;
				aceleracionX=0; aceleracionY=0;
				_parent.salida.gotoAndPlay("salir");
				_parent._parent.gotoAndPlay("ganar");
			}
		}
		// mover MUS y/o fondo
		if (_parent._parent.jugando) {
			if (velocidadX!=0 || velocidadY!=0) { //movimiento
				this._x+=velocidadX;
				this._y+=velocidadY;
				velocidadX+=aceleracionX;
				velocidadY+=aceleracionY;
				if (aceleracionX==0 && Math.abs(velocidadX)<(velocidadAndar/2)) velocidadX=0;
				if (aceleracionY==0 && Math.abs(velocidadY)<(velocidadAndar/2)) velocidadY=0;				
				/*
				//limitar movimiento fuera de fondo
				if (this._x<margenW) {this._x=margenW; velocidadX=0;}
				if (this._x>_parent.fondo._width-margenW) {this._x=_parent.fondo._width-margenW; velocidadX=0;}
				if (this._y<margenH) {this._y=margenH; velocidadY=0;}
				if (this._y>_parent.fondo._height-margenH) {this._y=_parent.fondo._height-margenH; velocidadY=0;}				
				//*/
				//mover fondo si en limites de ventana
				if ((this._x+_parent._x)<margenW) _parent._x+=margenW-(this._x+_parent._x);
				if ((this._x+_parent._x)>(bordeW-margenW)) _parent._x+=(bordeW-margenW)-(this._x+_parent._x);				
				if ((this._y+_parent._y)<margenH) _parent._y+=margenH-(this._y+_parent._y);
				if ((this._y+_parent._y)>(bordeH-margenH)) _parent._y+=(bordeH-margenH)-(this._y+_parent._y);				
				//guardar direccion, para cuando parado				
				if (velocidadX>0) haciaLado=1;
				if (velocidadX<0) haciaLado=-1;
				//segun direccion(angulo) poner animacion
				var angulo:Number = (Math.atan2(velocidadY,velocidadX)*180/Math.PI)+180;
				if (angulo>=30 and angulo<=60) this.gotoAndStop("play_upL");
				if (angulo>=60 and angulo<=120) this.gotoAndStop("play_up");
				if (angulo>=120 and angulo<=150) this.gotoAndStop("play_upR");
				if (angulo>=150 and angulo<=210) this.gotoAndStop("play_right");
				if (angulo>=210 and angulo<=240) this.gotoAndStop("play_downR");
				if (angulo>=240 and angulo<=300) this.gotoAndStop("play_down");
				if (angulo>=300 and angulo<=330) this.gotoAndStop("play_downL");
				if (angulo>=330 or angulo<=30) this.gotoAndStop("play_left");
			} else { //parado
				if (haciaLado==1) this.gotoAndStop("stop_right")
				else this.gotoAndStop("stop_left");
			}
		} //fin if _parent._parent.jugando
	}

	public function onKeyDown() {
		switch (Key.getCode()) {
		case 40:	//down
			velocidadY+=velocidadAndar;
			break;
		case 37 :	//left
			velocidadX-=velocidadAndar;
			break;
		case 39:	//right
			velocidadX+=velocidadAndar;	
			break;
		case 38:	//up
			velocidadY-=velocidadAndar;
			break;
		default :
				trace (Key.getCode());
			break;
		}
		if (velocidadX>velocidadMaxX) velocidadX=velocidadMaxX;
		if (velocidadX<velocidadMinX) velocidadX=velocidadMinX;
		if (velocidadY>velocidadMaxY) velocidadY=velocidadMaxY;
		if (velocidadY<velocidadMinY) velocidadY=velocidadMinY;
	}

	
}
//Variáveis
tempo_tiro = 60 * 2;
timer_tiro = 0;

vai_acontecer = function()
{
	timer_tiro++;
    
    if (x >= room_width/2)
	{
		vspeed = 2;
		hspeed = -1;
		
	}
    else 
    {
    	vspeed = 2;
		hspeed = 1;
    }
    
	
	
	if (timer_tiro >= tempo_tiro)
    {
        
		var _ang = 255;
		
		repeat(24)
		{
			var _tiro2 = instance_create_layer(x, y, "Inimigos", obj_anticorpo);
			_tiro2.vspeed = 4;
			_tiro2.direction = _ang;
			
			_ang += 15;
		}
        timer_tiro = 0;
    }
}


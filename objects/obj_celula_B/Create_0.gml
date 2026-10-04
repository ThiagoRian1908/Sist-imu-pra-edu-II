//Variáveis
tempo_tiro = 60 * 3;
timer_tiro = 0;

if (instance_exists(obj_personegem))
{
    if (x >= room_width/2)
	{
		vspeed = 0.5;
		hspeed = -1;
		
	}
    else if (x <= room_width/2 - 10)
    {
    	vspeed = 0.5;
		hspeed = 1;
    }
}


vai_acontecer = function()
{
	timer_tiro++;
    /*
    if (x >= room_width/2)
	{
		vspeed = 2;
		hspeed = -1;
		
	}
    else if (x <= room_width/2 - 10)
    {
    	vspeed = 2;
		hspeed = 1;
    }
    */
	
	
	if (timer_tiro >= tempo_tiro)
    {
        //Som do tiro
        audio_play_sound(snd_atirando, 1, 0);
        
		var _ang = 255;
		
		repeat(26)
		{
			var _tiro2 = instance_create_layer(x, y, "Inimigos", obj_anticorpo);
			_tiro2.vspeed = 4;
			_tiro2.direction = _ang;
			
			_ang += 20;
		}
        timer_tiro = 0;
    }
}


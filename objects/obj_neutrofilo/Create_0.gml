//O valor do efeito
escala_sobre = 1.2;

//Variáveis
estado = "chegando";

tempo_carregando = 60 * 2;
timer_carregando = 0;

tempo_tiro_prende = 60 * 3;
timer_tiro_prende = 0;

tempo_fugindo = 60 * 10;
timer_fugindo = 0;

estou_fugindo = 0;

//Máquina de estados
maquina_de_estados = function()
{
    switch (estado) 
    {
    	case "chegando":
        {
            if (y < 160)
            {
                vspeed = 1.2
            }
            else 
            {
                estado = "carregando"
            }
        }
        break;
    
        case "carregando":
        {
            vspeed = 0;
            
            timer_carregando++;
            
            if (timer_carregando >= tempo_carregando)
            {
                timer_carregando = 0;
                
                estado = choose("atirando", "atirando2");
            }
        }
        break;
    
        case "atirando":
        {
            //Esticando
            image_xscale = 1.5;
            image_yscale = 0.5;
            
            if (instance_exists(obj_personegem))
            {
                var _ang = 255;
                repeat(3)
                    {
                        var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro);
                        _tiro.speed = 4;
                        _tiro.direction = _ang;
    	    				
                        _ang += 15;
    	    				
    	    				
                    }
                estado = "carregando";		
            }
        }
        break;
    
        case "atirando2":
        {
            timer_tiro_prende++;
            
            if (timer_tiro_prende >= tempo_tiro_prende)
            {
                timer_tiro_prende = 0;
                estado = "carregando";
            }
            
            var _dir = point_direction(x, y, obj_personegem.x, obj_personegem.y);
            
            var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_prende);
            _tiro.speed = 1.5;
            _tiro.direction = _dir;
            _tiro.image_angle = _dir + 90;
        }
        break;
    
        case "fugindo":
        {
            if (!estou_fugindo)
            {
                hspeed = choose(-1, 1);
                
                estou_fugindo = 1
            }
            
            vspeed = -1;
			
			if (y < -50)
			{
				instance_destroy();
			}
            
        }
        
    
        
    }
    
    
    
}



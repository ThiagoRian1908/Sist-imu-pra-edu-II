controla_player();
colisao();


//Ficando prese
if (place_meeting(x, y, obj_tiro_prende))
{
    vel = 0;
}
else 
{
	vel = 3.5;
}
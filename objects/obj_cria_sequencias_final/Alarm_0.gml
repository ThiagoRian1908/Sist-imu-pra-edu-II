//if (global.acabou = 0) exit;

//Criando a sequência
layer_sequence_create("Seq_inimigos", 0, 0, ondas[atual]);


//Se ainda tenho ondas no array
if (atual < array_length(ondas) - 1)
{
    //Aumentando o atual
    atual++;
    
    //Reiniciando o alarme

    //alarm[0] = 320;
    alarm[0] = 400;
}




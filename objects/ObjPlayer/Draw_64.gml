/// @description Game UI (health)
margeX = 128
margeY = 128
draw_sprite(SprHealthbarBase,0,margeX,margeY);
draw_sprite_part(SprHealth, 0,
0, 0,
sprite_get_width(SprHealth)*global.player_hp/100, sprite_get_height(SprHealth), 
margeX, margeY);



draw_text(20,20, "fps_real : " + string(fps_real));
draw_text(20,40, "fps : " + string(fps));
draw_text(x,y, "damage_dash_count : " + string(damaging_dash_count));
draw_text(x,y+20, "shield_health : " + string(shield_health));

moveX = xstart + image_alpha * distanceReal - distance
color = make_color_rgb(image_alpha*255, image_alpha*255, image_alpha*255);
draw_sprite_ext(sprite_index, -1, moveX, y, image_xscale, image_yscale, image_angle, color, 1);
draw_set_color(c_white);


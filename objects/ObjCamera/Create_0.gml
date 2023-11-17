/// @description Insert description here
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1840;
view_hport[0] = 920;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, ObjPlayer, -1, -1, 400, 400);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - view_wport[0]/2;
var _ypos = (_dheight / 2) - view_hport[0]/2;
window_set_rectangle(_xpos, _ypos, view_wport[0], view_hport[0]);

surface_resize(application_surface, view_wport[0], view_hport[0]);
view_x= camera_get_view_x(view_camera[0]);
view_y= camera_get_view_y(view_camera[0]);
view_w= camera_get_view_width(view_camera[0]);
view_h= camera_get_view_height(view_camera[0]);
function [delta_t, t_number_of_points] = temporal_step(delta_x)
    d = inputs;
    
    delta_t = d.courant*delta_x/d.permanent_wind_velocity_x;
    t_number_of_points = 1 + d.total_time/delta_t;
end
function ticks = colorbar_ticks(min_value, max_value)
    min_order_of_magnitude = floor(log10(min_value));
    max_order_of_magnitude = floor(log10(max_value));
    base = linspace(1, 9, 9);

    log_array = [];

    for i = min_order_of_magnitude:1:max_order_of_magnitude
        log_array = [log_array base.*10^i];
    end

    ticks = log_array;
    upper_limit = (floorDiv(max_value, 10^max_order_of_magnitude) + 1)*10^max_order_of_magnitude;

    ticks = ticks(ticks <= upper_limit);
end
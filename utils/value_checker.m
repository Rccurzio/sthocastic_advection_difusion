function checked_value = value_checker(value)

    if value < 0 
        checked_value = 0; 
    elseif value > 1
        disp(value)
        checked_value = 1;
    else % 0 <= value <= 1
        checked_value = value;
    end

end
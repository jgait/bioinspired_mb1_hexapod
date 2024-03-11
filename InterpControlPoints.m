
function point_set = InterpControlPoints(start_point, end_point, pcnt, total_points)
    % InterpControlPoints - Returns an interpolated vector between start 
    % and end (exclusive) with length as a percentage of 101
    num_points = int32(total_points * (pcnt/100));
    x_points = linspace(start_point(1), end_point(1), num_points);
    y_points = linspace(start_point(2), end_point(2), num_points);
    z_points = linspace(start_point(3), end_point(3), num_points);

    point_set = [x_points(2:end-1)' y_points(2:end-1)' z_points(2:end-1)'];
end

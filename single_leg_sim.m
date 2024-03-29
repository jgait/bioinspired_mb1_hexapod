clear all
close all
clc

leg_rotation = deg2rad(0);

% Load control points and interpolate to set points
control_points = readmatrix("control_points.txt","NumHeaderLines",1);
set_points = ControlPoints2Trajectory(control_points);

% Plot setpoints
figure();
plot3(set_points(:,1), set_points(:,2), set_points(:,3), "ob")
input("enter to continue")


% Compute the angles using inverse kinematics
angle_sets = ones(101, 3);
for i = 1:length(set_points)
    ef_pos = set_points(i,:);
    temp_set = getLegAngles(ef_pos, leg_rotation);
    angle_sets(i,:) = applyOffsets(temp_set);
end

writematrix(rad2deg(angle_sets), "angles.txt")

% Plot angle trajectorys to ensure configuration continuity
figure();
plot3(angle_sets(:,1), angle_sets(:,2), angle_sets(:,3), 'bo')
title("Leg Angles (One Cycle)")
xlabel("Theta 1")
ylabel("Theta 2")
zlabel("Theta 3")
axis equal
input("enter to continue")

% Do forward kinematics to verify positions
positions = cell(101,1);
for i = 1:length(angle_sets)
    positions{i} = getLegPosePoints(angle_sets(i,:), leg_rotation);
end

fig = figure('Position', [100, 100, 1200, 600]);
for j = 1:2
    for i = 1:101
        plotLegPosePoints(fig, positions{i})
        pause(0.00001)
    end
end


function set_points = ControlPoints2Trajectory(control_points)
    % Generate set points from control points
    set_points = [];
    
    for i = 1:length(control_points)
        if i == length(control_points)
            start = control_points(i, 1:3);
            next = control_points(1, 1:3);
            pcnt = control_points(i,4);
        else
            start = control_points(i, 1:3);
            next = control_points(i+1, 1:3);
            pcnt = control_points(i,4);
        end
    
        segment_points = InterpControlPoints(start, next, pcnt, 101);
        set_points = [ set_points;
                       start;
                       segment_points;];
    end
end

function mod_angles = applyOffsets(angle_set)
    q1_offset = deg2rad(-4);
    q2_offset = deg2rad(35);
    q3_offset = deg2rad(68);
    zeroing_offset = deg2rad(90);
    
    mod_angles = [zeroing_offset + angle_set(1) - q1_offset, zeroing_offset + angle_set(2) - q2_offset, zeroing_offset + q3_offset - angle_set(3)];
end

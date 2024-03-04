clear all
close all
clc

angle1 = [linspace(0, 45, 50), linspace(45, 0, 50)]; 
angle2 = [linspace(20, 60, 30), linspace(60, 20, 70)]; 
angle3 = [linspace(60, 90, 90), linspace(90, 60, 10)]; 

poses = [angle1', angle2', angle3'];

numrows = size(poses, 1);
fig = figure('Position', [100, 100, 1200, 600]);

for i = 1:(numrows*5)

    pose = getLegPosePoints(poses(mod(i, 100)+1,:));

    plotLegPosePoints(fig, pose);
   
    pause(0.001)
end

function leg_points = getLegPosePoints(leg_angles)
    theta1 = deg2rad(leg_angles(1));
    theta2 = deg2rad(leg_angles(2));
    theta3 = deg2rad(leg_angles(3));

    L1 = 43;
    L2 = 80;
    L3 = 134;
    
    % Rotation about Z by theta1
    T_O2Oprime = [myrotmat(theta1,'Z'), [0; 0; 0]];
    T_O2Oprime = [T_O2Oprime; [0 0 0 1]];

    % Rotation by theta2 about X, Translation by L1 along Y
    T_Oprime2A = [myrotmat((2*pi) - theta2, 'Y'), [L1; 0; 0]];
    T_Oprime2A = [T_Oprime2A; [0 0 0 1]];

    T_A2B = [myrotmat((2*pi) - theta3 + pi, 'Y'), [L2; 0; 0]];
    T_A2B = [T_A2B; [0 0 0 1]];
    
    
    PoA = T_O2Oprime * T_Oprime2A * [0; 0; 0; 1];
    PoB = T_O2Oprime * T_Oprime2A * T_A2B * [0; 0; 0; 1];

    % Point P in frame p
    PpP = [L3; 0; 0; 1];
    PoP = T_O2Oprime * T_Oprime2A * T_A2B * PpP;

    leg_points = [ PoA(1) PoB(1) PoP(1);
                   PoA(2) PoB(2) PoP(2);
                   PoA(3) PoB(3) PoP(3);];
end

function plotLegPosePoints(fig_handle, leg_points)
    % leg joint - is a 3x3 matrix of points describing the position of each
    %     J1  J2  J3
    %   x  #   #   #
    %   y  #   #   #
    %   z  #   #   #
    
    figure(fig_handle);
    
    clf

    subplot(2, 2, 1);
    plot3([0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'b-', [0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'bo', 'MarkerFaceColor', 'b', 'LineWidth', 1.5);
    view(90, 90)
    grid on;
    axis equal;
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    xlim([-10, 200])
    ylim([-200, 200])
    zlim([-200, 200])
    view(90, 90);

    subplot(2, 2, 2);
    plot3([0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'b-', [0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'bo', 'MarkerFaceColor', 'b', 'LineWidth', 1.5);
    view(0, 90)
    grid on;
    axis equal;
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    xlim([-10, 200])
    ylim([-200, 200])
    zlim([-200, 200])
    view(45, 30);

    subplot(2, 2, 3);
    plot3([0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'b-', [0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'bo', 'MarkerFaceColor', 'b', 'LineWidth', 1.5);
    view(90, 90)
    grid on;
    axis equal;
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    xlim([-10, 200])
    ylim([-200, 200])
    zlim([-200, 200])
    view(90, 0);

    subplot(2, 2, 4);
    plot3([0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'b-', [0, leg_points(1,:)], [0, leg_points(2,:)], [0, leg_points(3,:)], 'bo', 'MarkerFaceColor', 'b', 'LineWidth', 1.5);
    view(45, 30)
    grid on;
    axis equal;
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    xlim([-10, 200])
    ylim([-200, 200])
    zlim([-200, 200])
    view(0, 0);

end

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
    title("Top View")
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
    title("3/4 View")
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
    title("Side View")
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
    title("Back View")
    xlim([-10, 200])
    ylim([-200, 200])
    zlim([-200, 200])
    view(0, 0);

end

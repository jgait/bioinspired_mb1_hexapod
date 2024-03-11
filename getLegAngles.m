function leg_angles = getLegAngles(ef_point, theta1_offset)
    L1 = 43;
    L2 = 80;
    L3 = 134;

    Xo = ef_point(1);
    Yo = ef_point(2);
    Zo = -1*ef_point(3);

    theta1 = atan(Yo/Xo) - theta1_offset;
    theta2 = acos((L2^2 + ((sqrt(Xo^2 + Yo^2)-L1)^2 + Zo^2)-L3^2)/(2*L2*sqrt((sqrt(Xo^2 + Yo^2)-L1)^2 + Zo^2))) - atan(Zo/(sqrt(Xo^2+Yo^2)-L1));
    theta3 = acos((L2^2+L3^2-((sqrt(Xo^2 + Yo^2)-L1)^2 + Zo^2))/(2*L2*L3));

    leg_angles = [theta1; theta2; theta3];
end
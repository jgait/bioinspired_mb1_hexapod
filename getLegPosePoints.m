function leg_points = getLegPosePoints(leg_angles, theta1_offset)
    theta1 = leg_angles(1);
    theta2 = leg_angles(2);
    theta3 = leg_angles(3);

    L1 = 43;
    L2 = 80;
    L3 = 134;
    
    % Rotation about Z by theta1
    T_O2Oprime = [myrotmat(theta1 + theta1_offset,'Z'), [0; 0; 0]];
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
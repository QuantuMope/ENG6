%% HW 9
%% Problem 1 Task 1
A=electron1;
B=electron2;
if A.principal==B.principal & A.azimuthal==B.azimuthal & A.magnetic==B.magnetic & A.spin==B.spin
    if B.spin==char('up')
        B.spin=char('down');
    else B.spin=char('down');
        B.spin=char('up');
    end
end
A.energy=(-2.18*(10^18))/(A.principal^2);
B.energy=(-2.18*(10^18))/(B.principal^2);
if A.energy>B.energy
    disp(A)
    disp(B)
elseif A.energy<B.energy
    disp(B)
    disp(A)
else A.energy=B.energy;
    if A.spin==char('up')
        disp(A)
        disp(B)
    else
        disp(B)
        disp(A)
    end
end
clc
clear all
format short g

%Known Data
W= 14;      %max payload in pounds
D= [15 30 45 60];       %diameter of circles
N= [2 4 6];   %no. of dynamic payloads
sp= W-N*2;   %wt. of static payload in pounds
z= [1 0.75 0.5 0.25];       %zone multiplier

%Probability of hitting given zome
A= pi.*D.^2./4;         %areas of co-centric circles
p(1)= A(1)/A(4);
for i= 2:4
    p(i)= (A(i)-A(i-1))/A(4);
end

%conversion to 4x4 matrix
SP= (sp').*(ones(3, 4));       %weight of static payload
P= p.*(ones(3, 4));        %probablility of each zone

%Score Calculation
Z= N'*z;    %zone multiplier for diff combination of payloads and zone
FFS= SP + (SP.*Z);      %Final Flight Score

%Probable score 
probable_FFS= SP + (P.*(SP.*Z));        

%Output
disp('N= no. of dynamic payloads');
fprintf('Static + Dynamic = %d lbs \n\n', W);
disp('Final Flight Score');
fprintf('     N    Z1    Z2    Z3   Z4 \n');
disp([N' FFS]);
disp('Probable Flight Score');
fprintf('\t\t    N \t\t  Zone 1 \t  Zone 2 \t  Zone 3 \t   Zone 4 \n');
disp([N' probable_FFS]);
disp('#################');
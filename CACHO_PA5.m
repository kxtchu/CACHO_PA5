% ECE 2112 - Advanced Computer Programming and Algorithms
% Experiment 5: Introduction to MATLAB Programming
% Name: Nathan Josh Cacho
% Section: 2ECE-B
%
% This program demonstrates transpose operations on real and
% complex matrices and solves a linear system using the
% inverse method and Cramer's Rule.

clc;
clear;
close all;

%% PROBLEM A: TRANSPOSE OPERATIONS

% Define the real matrix R.
% Semicolons separate rows, while spaces separate columns.
R = [5 -2 0 7;
     1  3 -4 2;
     6  0 8 -1];

% Define the complex matrix Z.
% The letter i represents the imaginary unit.
Z = [2+3i -1+4i 5-2i;
     -3+i  6     2+5i];

% Display the original matrices.
disp('PROBLEM A: TRANSPOSE OPERATIONS');
disp('Original Real Matrix R:');
disp(R);

disp('Original Complex Matrix Z:');
disp(Z);

%% Transpose Operations for Real Matrix R

% transpose(R) swaps rows and columns without conjugation.
R_transpose = transpose(R);

% R' performs a complex-conjugate transpose.
% Since R contains only real numbers, this produces
% the same result as the regular transpose.
R_apostrophe = R';

% R.' performs a transpose without complex conjugation.
R_dot_transpose = R.';

disp('transpose(R):');
disp(R_transpose);

disp('R'':');
disp(R_apostrophe);

disp('R.'':');
disp(R_dot_transpose);

%% Transpose Operations for Complex Matrix Z

% transpose(Z) swaps rows and columns without changing
% the signs of the imaginary components.
Z_transpose = transpose(Z);

% Z' swaps rows and columns and takes the complex conjugate.
% This changes +bi to -bi and -bi to +bi.
Z_apostrophe = Z';

% Z.' swaps rows and columns without taking
% the complex conjugate.
Z_dot_transpose = Z.';

disp('transpose(Z):');
disp(Z_transpose);

disp('Z'':');
disp(Z_apostrophe);

disp('Z.'':');
disp(Z_dot_transpose);

%% Answers to Problem A

% a. For the real matrix R, all three operations give
%    identical results because R has no imaginary parts.
%
% b. For the complex matrix Z, transpose(Z) and Z.'
%    produce identical results because neither operation
%    changes the signs of the imaginary parts.
%
% c. The apostrophe operator (') performs complex
%    conjugation in addition to transposing the matrix.
%    Every imaginary component changes sign.

%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM

disp('PROBLEM B: LINEAR SYSTEM');

% Define the coefficient matrix A.
% Each row corresponds to one equation.
% Each column corresponds to x1, x2, x3, or x4.
A = [ 2 -1  3  2;
      1  4 -2  1;
      3  2  1 -1;
     -2  3  4  2];

% Define the right-hand-side column vector.
b = [16;
     -7;
      6;
      7];

% Display the coefficient matrix and constant vector.
disp('Coefficient Matrix A:');
disp(A);

disp('Right-Hand-Side Vector b:');
disp(b);

%% METHOD 1: INVERSE METHOD

% Calculate the inverse of coefficient matrix A.
A_inverse = inv(A);

% Multiply the inverse of A by b to obtain the
% solution vector for the four unknown variables.
x_inv = A_inverse * b;

disp('Inverse of Matrix A:');
disp(A_inverse);

disp('Solution Using Inverse Method:');
disp(x_inv);

%% METHOD 2: CRAMER'S RULE

% Calculate the determinant of matrix A.
% A nonzero determinant means the system has
% a unique solution.
det_A = det(A);

% Create an empty column vector for the four solutions.
x_cramer = zeros(4,1);

% Use a for loop to solve each unknown variable.
for k = 1:4

    % Create a copy of matrix A.
    A_modified = A;

    % Replace column k with the constant vector b.
    A_modified(:,k) = b;

    % Apply Cramer's Rule:
    % x_k = det(A_modified) / det(A)
    x_cramer(k) = det(A_modified) / det_A;

end

disp('Determinant of Matrix A:');
disp(det_A);

disp('Solution Using Cramer''s Rule:');
disp(x_cramer);

%% NUMERICAL VERIFICATION

% Check whether both methods produce the same solution.
% A value close to zero indicates agreement.
difference_norm = norm(x_inv - x_cramer);

% Substitute the inverse-method solution back into Ax = b.
% A value close to zero indicates that the solution
% satisfies the original equations.
residual_norm = norm(A*x_inv - b);

disp('Norm of Difference Between the Two Methods:');
disp(difference_norm);

disp('Norm of Residual (A*x_inv - b):');
disp(residual_norm);

%% FINAL OUTPUT

disp('FINAL SOLUTION:');
fprintf('x1 = %.6f\n', x_inv(1));
fprintf('x2 = %.6f\n', x_inv(2));
fprintf('x3 = %.6f\n', x_inv(3));
fprintf('x4 = %.6f\n', x_inv(4));

disp('End of Experiment 5.');
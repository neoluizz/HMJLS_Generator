% -- Luiz H. Romero -- neoluizz@gmail.com - March 08, 2025
%
%
% The following algorithm generates the system matrix A following a Gaussian distribution, 
% with approximately half of the randomly selected elements set to zero.
%
% 
% -- Inputs:
%
%    N --> State space cardinality.
%    n --> Dimension of A matrix.
%
% -- Outputs:
%
%    A --> The matrix A of the system.


% ---
function A = generate_A(N,n)

    % -- The algorithm begins by preallocating memory for the A matrix.
    % Afterward, approximately half of the elements in each mode are randomly selected 
    % and filled according to a Gaussian distribution.
    A = zeros(n,n,N);
    for nn = 1:N
        for i = 1:round(n^2/2)
            A(randi(n),randi(n),nn) = rand;
        end
    end  
end
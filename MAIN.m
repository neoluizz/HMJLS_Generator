% -- Luiz H. Romero -- neoluizz@gmail.com - March 08, 2025
%
%
% The algorithm generates examples of a hidden Markov jump linear system.



% -----
% -- NUMBER OF INSTANCES.
NINSTANCES = 1000;


% -- The folder in which each example will be stored. If it does not exist, the algorithm automatically creates it.
folder = './examples/';
try
    eval(sprintf('mkdir ''%s'' ',folder))
catch
    error('Error! This folder does exist.');
end


% ----------
for k = 1:NINSTANCES
    
    % -----The variables above can be altered as desired.
    % -- State space cardinality.
    N = randi([4,5]);
    % -- Dimension of x.
    n = randi([2,3]); 
    % -- Dimension of u. 
    m = randi([1,2]);
    % -- Dimension of noise.
    r = randi([1,2]);
    % -- Output.
    s = m + n; 
    
    % -----
    % -- Output of the Markov chain Q, transitin matrix P and initial distribution.
    % The output of the Markov chain Q follows the same reasoning as the transition matrix P. 
    % Therefore, we use the same code to generate it.
    % Also, both P and Q are stochastic matrices and must satisfy the fundamental properties of 
    % stochastic matrices; specifically, each matrix must have non-negative entries, and the sum of the 
    % elements in each row must equal one.
    % To avoid numerical errors, we will execute the code to generate these matrices repeatedly until one 
    % satisfies these properties.
    %
    % -- Output of the Markov chain Q.
    check_Q = 0;
    while check_Q == 0
        Q = generate_P(N);
        if any(Q(:) < 0) || any(Q(:) > 1) || any(abs(sum(Q,2) - 1) > 0) || any(all(Q == 0,1))
            continue;
        else
            check_Q = 1;
        end
    end
    % -- Transition matrix P. 
    check_P = 0;
    while check_P == 0
        P = generate_P(N);
        if any(P(:) < 0) || any(P(:) > 1) || any(abs(sum(P,2) - 1) > 0) || any(all(P == 0,1))
            continue;
        else
            check_P = 1;
        end
    end
    % -- Initial distribution.
    pi0 = zeros(1,N);
    pi0(1) = 1;
    
    
    % -----
    % -- Generating system's matrices
    A = generate_A(N,n);
    B = randn(n,m,N);    
    E = randn(n,r,N);
    % -- Regarding matrices C and D, one needs to consider the restriction C'D = 0 to maintain the desired
    % system properties. Therefore, the algorithm begins by creating an auxiliary variable, which 
    % is then used to generate C and D.
    aux_C = randn(s,n,N);
    aux_D = randn(s,n,N);
    % -- Matrices C and D.
    C = []; 
    D = [];
    for i = 1:N
        C(:,:,i) = [ aux_C(:,:,i) ; zeros(s,n) ];
        D(:,:,i) = [ zeros(s,n) ; aux_D(:,:,i) ];
    end
   
   
    
    % --- SAVING DATA.
    eval(sprintf(['save ',folder,'example_%d A B C D Q P pi0'],k));
    clearvars -except k folder NINSTANCES;
    
end
% -- Eduardo F. Costa -- efcosta@icmc.usp.br | fontourace@gmail.com - March 08, 2025
%
%
% The following algorithm generates a transition matrix following a Gaussian distribution, 
% with approximately half of the randomly selected elements set to zero.
%
%
% -- Inputs:
%
%    N --> State space cardinality.
%
% -- Outputs:
%
%    P --> Transition probability matrix.


% ----------
function P = generate_P(N)

    % -- The algorithm starts by preallocating memory for an N x N matrix.
    % After that, approximately half of the elements are randomly selected and filled according to a Gaussian distribution.
    P = zeros(N,N);
    for i = 1:round(N^2/2)
        P(randi(N),randi(N)) = rand;
    end

    
    % -- The algorithm then checks whether any column sums to zero. 
    % If such a column is found, it is corrected to ensure proper functionality.
    aux = sum(P,1);
    aux = find(aux==0);
    for  i = aux
        P(i,i) = 1;
    end

    % -- Additionally, the algorithm ensures that each row sums to one. 
    % If any row does not satisfy this condition, it is adjusted accordingly.
    aux = sum(P,2);
    aux = find(aux == 0);
    for i = aux
        P(i,i) = 1;
    end
    aux_ = sum(P,2);
    for i = 1:N
       P(i,:) = P(i,:)  / aux_(i);
    end
end
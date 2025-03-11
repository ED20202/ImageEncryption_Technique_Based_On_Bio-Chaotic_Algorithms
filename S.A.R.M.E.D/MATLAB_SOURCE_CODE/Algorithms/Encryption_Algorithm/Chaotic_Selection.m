function bestMask = Chaotic_Selection(rows, cols, N, x, y, z)
%<========================================================================>
depth=3;
Tsize = rows * cols * depth;
chaoticMasks = zeros(Tsize, N, 'uint8'); 
entropyValues = zeros(1, N);

%<========================================================================>
% Slightly change X Y Z values for diversity
    for i = 1:N
        x0 = x + (i - 1) * 1e-5;
        y0 = y + (i - 1) * 1e-5;
        z0 = z + (i - 1) * 1e-5;
%<========================================================================>
        chaoticMasks(:, i) = generateChaoticMask(Tsize, x0, y0, z0);
        entropyValues(i) = entropyFitness(chaoticMasks(:, i));
    end
    bestIndex = tournamentSelection(entropyValues, N);
    Mask = chaoticMasks(:, bestIndex);
    bestMask=reshape(Mask,rows,cols,depth);
 
end
%<========================================================================>
function chaoticMask = generateChaoticMask(Tsize, x, y, z)
    chaoticMask = zeros(Tsize, 1, 'uint8');
    sigma = 10; rho = 28; beta = 8/3; dt = 0.01;
    for i = 1:Tsize
        dx = sigma * (y - x);
        dy = x * (rho - z) - y;
        dz = x * y - beta * z;
        x = x + dx * dt;
        y = y + dy * dt;
        z = z + dz * dt;
        chaoticMask(i) = floor(mod((x * y * z) * 1e4, 256));
    end
end
%<========================================================================>
% Calculate entropy for all masks works only for 1d vectors
function fitness = entropyFitness(sequence)
 indices = double(sequence(:)) + 1; 
counts = accumarray(indices, 1, [256, 1]);
probs = counts / numel(sequence);
probs(probs == 0) = []; % Remove zero probabilities
fitness = -sum(probs .* log2(probs));
end
%<========================================================================>
% Select highest entropy
function bestIndex = tournamentSelection(fitnessValues, k)
    N = length(fitnessValues);
    candidates = randperm(N, k); 
    [~, bestIdx] = max(fitnessValues(candidates));
    bestIndex = candidates(bestIdx);
end
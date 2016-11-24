% assuming data set are in data folder
train = DataSet('train');
test = DataSet('test');

% load target vector
Y = train.targets;

% normalize data
% only done once, normalized data is stored to disk!
% path is ./data/set_name/normalized/x.nii
fprintf('%s normalize training data\n', ts());
train.normalize_set();
fprintf('%s normalize test data\n', ts());
test.normalize_set();

% generate the cuboids
fprintf('%s generate cubes\n', ts());
cubes = generate_cubes(9, train);

% extract features
fprintf('%s extract features from training data\n', ts());
X = extract_features('train', cubes, 20, true);
fprintf('%s extract features from test data\n', ts());
Xt = extract_features('test', cubes, 20, true);

% normalize features (optional)
%[X, Xt, ~] = normalize_features(X, Xt, 1.25);

% regression for all values
% fprintf('%s perform regression\n', ts());
% [B, I] = lasso(X, Y, 'Alpha', 0.35, 'CV', 17);

% get beta hat
% i = I.IndexMinMSE;
% b = B(:, i);
% o = I.Intercept(i);

% mdl = fitcsvm(X, Y, 'KernelFunction', 'rbf', 'KernelScale', 'auto');

% calculate prediction for test set
fprintf('%s calculate prediction\n', ts());
% Y_pred = Xt*b+o;
% Y_pred = mdl.predict(Xt);

% write prediction to .csv
fprintf('%s write prediction\n', ts());
% create_submission(Y_pred);

% upload at https://inclass.kaggle.com/c/mlp2/submissions/attach

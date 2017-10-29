%Visit to Asia
0.01::visitToAsia.


%Has Tuberculosis
0.05::hasTuberculosis :- visitToAsia.
0.01::hasTuberculosis :- \+visitToAsia.


%Smoker
0.50::smoker.


%Has Lung Cancer
0.10::hasLungCancer :- smoker.
0.01::hasLungCancer :- \+smoker.


%Has Bronchitis
0.60::hasBronchitis :- smoker.
0.30::hasBronchitis :- \+smoker.


%TuberculosisOrCancer
1.00::eitherTuberculosisOrCancer :- hasLungCancer, hasTuberculosis.
1.00::eitherTuberculosisOrCancer :- hasLungCancer, \+hasTuberculosis.
1.00::eitherTuberculosisOrCancer :- \+hasLungCancer, hasTuberculosis.
0.00::eitherTuberculosisOrCancer :- \+hasLungCancer, \+hasTuberculosis.


%XRay Result
0.98::positiveXRayResult :- eitherTuberculosisOrCancer.
0.05::positiveXRayResult :- \+eitherTuberculosisOrCancer.


%Dyspnea
0.90::dyspnea :- eitherTuberculosisOrCancer, hasBronchitis.
0.70::dyspnea :- eitherTuberculosisOrCancer, \+hasBronchitis.
0.80::dyspnea :- \+eitherTuberculosisOrCancer, hasBronchitis.
0.10::dyspnea :- \+eitherTuberculosisOrCancer, \+hasBronchitis.


%Test case 1 - without any evidence

%Test case 2
%evidence(visitToAsia,true).

%Test case 3
%evidence(visitToAsia,true).
%evidence(smoker,true).

%Test case 4
%evidence(visitToAsia,true).
%evidence(smoker,true).
%evidence(positiveXRayResult,true).

%Test case 5
%evidence(visitToAsia,true).
%evidence(smoker,true).
%evidence(positiveXRayResult,true).
%evidence(dyspnea,true).

query(visitToAsia).
query(hasTuberculosis).
query(smoker).
query(hasLungCancer).
query(eitherTuberculosisOrCancer).
query(positiveXRayResult).
query(hasBronchitis).
query(dyspnea).

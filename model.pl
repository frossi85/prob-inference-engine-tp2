%Visit to Asia
0.01::visitToAsia.


%Has Tuberculosis
0.0104::hasTuberculosis :- visitToAsia.
0.9896::hasTuberculosis :- \+visitToAsia.


%Smoker
0.5::smoker.


%Has Lung Cancer
0.055::hasLungCancer :- smoker.
0.9450::hasLungCancer :- \+smoker.





%Has Bronchitis
0.45::hBCause1.
0.55::hBCause2.

hasBronchitis :- smoker, hBCause1.
hasBronchitis :- \+smoker, hBCause2.


%TuberculosisOrCancer

0.000572::tOCCause1.
0.054428::tOCCause2.
0.009828::tOCCause3.
0.935172::tOCCause4.

tuberculosisOrCancer :- hasLungCancer, hasTuberculosis, tOCCause1.
tuberculosisOrCancer :- hasLungCancer, \+hasTuberculosis, tOCCause2.
tuberculosisOrCancer :- \+hasLungCancer, hasTuberculosis, tOCCause3.
tuberculosisOrCancer :- \+hasLungCancer, \+hasTuberculosis, tOCCause4.


%XRay Result
0.1103::xRRCause1.
0.8897::xRRCause2.

xRayResult :- tuberculosisOrCancer, xRRCause1.
xRayResult :- \+tuberculosisOrCancer, xRRCause2.


%Dyspnea

0.02916::dCause1.
0.03564::dCause2.
0.42084::dCause3.
0.51436::dCause4.

dyspnea :- tuberculosisOrCancer, hasBronchitis, dCause1.
dyspnea :- tuberculosisOrCancer, \+hasBronchitis, dCause2.
dyspnea :- \+tuberculosisOrCancer, hasBronchitis, dCause3.
dyspnea :- \+tuberculosisOrCancer, \+hasBronchitis, dCause4.


evidence(visitToAsia,true).
evidence(smoker,false).
evidence(hasBronchitis,false).
evidence(dyspnea,true).

query(xRayResult).
query(hasTuberculosis).
query(tuberculosisOrCancer).
query(hasLungCancer).

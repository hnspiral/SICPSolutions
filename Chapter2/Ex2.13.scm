;;; Assumptions:
;;; - Small percentage tolerance
;;; - All numbers are positive
;;; With 2 intervals i1 (c1,p1), i2 (c2,p2), i12 (c3,p3)
;;; is product of 2 intervals
;;; Width of i1 and width of i2 are calculated as followed:
;;; w1 = c1*p1/100
;;; w2 = c2*p2/100
;;; Lower and upper bounds of i1 and i2 are calculated as followed:
;;; l1 = c1 - w1; u1 = c1 + w1
;;; l2 = c2 - w2; u2 = c2 + w2
;;; Since all l1, l2, u1, u2 are positive. l12 and u12 (lower and upper bounds)
;;; of i12 respectively can be calculated as:
;;; l12 = l1 * l2 = (c1 - w1) * (c2 - w2) = c1c2 - c2w1 - c1w2 + w1w2
;;; u12 = u1 * u2 = (c1 + w1) * (c2 + w2) = c1c2 + c2w1 + c1w2 + w1w2
;;; c12 = (l12 + u12)/2 = c1c2 + w1w2
;;; w12 = c2w1 + c1w2 = c2c1p1/100 + c2p2c1/100 = c1c2(p1 + p2)/100
;;; Since w1w2 are small (p1 and p2 are small) we can approximate
;;; c12 to c1c2
;;; w12 = c12 (p1+p2)/100
;;; w12 = c12 * p12 /100
;;; => p12 = p1 + p2

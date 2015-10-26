#lang racket
;;----------------Homework 4------------------------
;;Kurt Slagle
;;EECS 368

;;<<<<<<<<<<<<<<<<PROBLEM 1>>>>>>>>>>>>>>>>>>>>>>>>>
;;This problem was just to alter the MIT code
;;<<<<<<<<<<<<<<<<Problem 2>>>>>>>>>>>>>>>>>>>>>>>>>
;;4.55

;;; Query input:
(supervisor ?x (Bitdiddle Ben))

;;; Query results:
(supervisor (Tweakit Lem E) (Bitdiddle Ben))
(supervisor (Fect Cy D) (Bitdiddle Ben))
(supervisor (Hacker Alyssa P) (Bitdiddle Ben))

;;; Query input:
(job ?x (accounting . ?y))

;;; Query results:
(job (Cratchet Robert) (accounting scrivener))
(job (Scrooge Eben) (accounting chief accountant))

;;; Query input:
(address ?x (Slumerville . ?z))

;;; Query results:
(address (Aull DeWitt) (Slumerville (Onion Square) 5))
(address (Reasoner Louis) (Slumerville (Pine Tree Road) 80))
(address (Bitdiddle Ben) (Slumerville (Ridge Road) 10))

;;4.56=========================================================

;a
;;; Query input:
(and (supervisor ?x (Bitdiddle Ben)) (address ?x ?y))

;;; Query results:
(and (supervisor (Tweakit Lem E) (Bitdiddle Ben)) (address (Tweakit Lem E) (Boston (Bay State Road) 22)))
(and (supervisor (Fect Cy D) (Bitdiddle Ben)) (address (Fect Cy D) (Cambridge (Ames Street) 3)))
(and (supervisor (Hacker Alyssa P) (Bitdiddle Ben)) (address (Hacker Alyssa P) (Cambridge (Mass Ave) 78)))

;b
;;; Query input:
(and (salary (Bitdiddle Ben) ?bsalary) (salary ?p ?a) (lisp-value < ?a ?bsalary))

;;; Query results:
(and (salary (Bitdiddle Ben) 60000) (salary (Aull DeWitt) 25000) (lisp-value < 25000 60000))
(and (salary (Bitdiddle Ben) 60000) (salary (Cratchet Robert) 18000) (lisp-value < 18000 60000))
(and (salary (Bitdiddle Ben) 60000) (salary (Reasoner Louis) 30000) (lisp-value < 30000 60000))
(and (salary (Bitdiddle Ben) 60000) (salary (Tweakit Lem E) 25000) (lisp-value < 25000 60000))
(and (salary (Bitdiddle Ben) 60000) (salary (Fect Cy D) 35000) (lisp-value < 35000 60000))
(and (salary (Bitdiddle Ben) 60000) (salary (Hacker Alyssa P) 40000) (lisp-value < 40000 60000))

;c
;;; Query input:
(and (supervisor ?x ?y) (not (job ?y (computer ?type))) (job ?y ?title))

;;; Query results:
(and (supervisor (Aull DeWitt) (Warbucks Oliver)) (not (job (Warbucks Oliver) (computer ?type))) (job (Warbucks Oliver) (administration big wheel)))
(and (supervisor (Cratchet Robert) (Scrooge Eben)) (not (job (Scrooge Eben) (computer ?type))) (job (Scrooge Eben) (accounting chief accountant)))
(and (supervisor (Scrooge Eben) (Warbucks Oliver)) (not (job (Warbucks Oliver) (computer ?type))) (job (Warbucks Oliver) (administration big wheel)))
(and (supervisor (Bitdiddle Ben) (Warbucks Oliver)) (not (job (Warbucks Oliver) (computer ?type))) (job (Warbucks Oliver) (administration big wheel)))


;;4.57==========================================================================================

;a
;;; Query input:
(assert! (rule (can-replace ?p-1 ?p-2)
   (and
      (or (and (job ?p-1 ?job) (job ?p-2 ?job))
          (and (job ?p-1 ?job1) 
               (and (job ?p-2 ?job2) (can-do-job ?job1 ?job2))))
      (not (same ?p-1 ?p-2)))))

Assertion added to data base.
;;; Query input:
(can-replace ?n (Fect Cy D))

;;; Query results:
(can-replace (Bitdiddle Ben) (Fect Cy D))
(can-replace (Hacker Alyssa P) (Fect Cy D))


;b
;;; Query input:
(assert! (rule (can-replace-cheaper ?p1 ?p2)
(and  (and    (and (can-replace ?p1 ?p2) 
                   (salary ?p1 ?p1-sal)) 
      (salary ?p2 ?p2-sal)) 
(lisp-value < ?p1-sal ?p2-sal))))

Assertion added to data base.
;;; Query input:
(can-replace-cheaper ?x ?y)

;;; Query results:
(can-replace-cheaper (Aull DeWitt) (Warbucks Oliver))
(can-replace-cheaper (Fect Cy D) (Hacker Alyssa P))


;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<PROBLEM 3>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;a
;;; Query input:
(assert! (rule (append-to-form () ?y ?y)))
(assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))(append-to-form ?v ?y ?z)))
(append-to-form (a b) (c d) ?z)
(append-to-form (a b) ?y (a b c d))
(append-to-form ?x ?z (a b c d))
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
;;; Query results:
(append-to-form (a b) (c d) (a b c d))
;;; Query input:
;;; Query results:
(append-to-form (a b) (c d) (a b c d))
;;; Query input:
;;; Query results:
(append-to-form (a b c d) () (a b c d))
(append-to-form () (a b c d) (a b c d))
(append-to-form (a) (b c d) (a b c d))
(append-to-form (a b) (c d) (a b c d))
(append-to-form (a b c) (d) (a b c d))
;;; Query input:
(assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))(append-to-form ?v ?y ?z)))
(assert! (rule (append-to-form () ?y ?y)))
(append-to-form (a b) (c d) ?z)
(append-to-form (a b) ?y (a b c d))
(append-to-form ?x ?z (a b c d))
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
;;; Query results:
(append-to-form () (a b c d) (a b c d))
(append-to-form (a) (b c d) (a b c d))
(append-to-form (a b) (c d) (a b c d))
(append-to-form (a b c) (d) (a b c d))
(append-to-form (a b c d) () (a b c d))



;;b
;;4.61
;;; Query input:
(assert! (rule (?x next-to ?y in (?x ?y . ?u))))
(assert! (rule (?x next-to ?y in (?v . ?z)) (?x next-to ?y in ?z)))
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
(?x next-to ?y in (1 (2 3) 4))
;;; Query results:
((2 3) next-to 4 in (1 (2 3) 4))
(1 next-to (2 3) in (1 (2 3) 4))
;;; Query input:
(?x next-to 1 in (2 1 3 1))
;;; Query results:
(3 next-to 1 in (2 1 3 1))
(2 next-to 1 in (2 1 3 1))


;;c
;;; Query input:
(assert! (rule (tree->list (?x . ?y)?v ?a)
         (and (tree->list ?x ?v ?u)(tree->list ?y ?u ?a))))
(assert! (rule (tree->list ?s ?v ?a)(and (Ap (?s)?v ?a)(lisp-value symbol? ?s))))
(assert! (rule (tree->list ()?v ?a)(Ap ()?v ?a)))
(assert! (rule (tree->list ?t ?v)(tree->list ?t ?v ())))
(assert! (rule (Ap (?x1) (?x1 . ?l)?l)))
(assert! (rule (Ap ()?l ?l)))
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
(tree->list (((a . b).(c . d)) . (d .(e . f))) ?z)
;;; Query results:
(tree->list (((a . b) c . d) d e . f) (a b c d d e f))
;;; Query input:
(assert! (rule (tree->list ?n ?v ?a)(and (Ap (?n) ?v ?a)(lisp-value number? ?n))))
Assertion added to data base.
;;Added 'number?' - the only difference between the old tree list and the new one is the new one (below) has
;;numbers and not just symbols
;;; Query input:
(tree->list (((a . 2).(c . 4)) . (4 .(e . 6))) ?z)
;;; Query results:
(tree->list (((a . 2) c . 4) 4 e . 6) (a 2 c 4 4 e 6))

;;d
;;The first example retruns an infinite tree of nulls
;;The second example returns an inifinite tree of nulls with 2 a's in different spots
;;The third cannot return, because (a b) is not a valid value



;;<<<<<<<<<<<<<PROBLEM 4>>>>>>>>>>>>>>>>>>>>>>>>>
;a====================
;;; Query input:
(and (supervisor ?x ?y) (not (job ?x (computer programmer))))

;;; Query results:
(and (supervisor (Aull DeWitt) (Warbucks Oliver)) (not (job (Aull DeWitt) (computer programmer))))
(and (supervisor (Cratchet Robert) (Scrooge Eben)) (not (job (Cratchet Robert) (computer programmer))))
(and (supervisor (Scrooge Eben) (Warbucks Oliver)) (not (job (Scrooge Eben) (computer programmer))))
(and (supervisor (Bitdiddle Ben) (Warbucks Oliver)) (not (job (Bitdiddle Ben) (computer programmer))))
(and (supervisor (Reasoner Louis) (Hacker Alyssa P)) (not (job (Reasoner Louis) (computer programmer))))
(and (supervisor (Tweakit Lem E) (Bitdiddle Ben)) (not (job (Tweakit Lem E) (computer programmer))))


;;; Query input:
(and (not (job ?x (computer programmer)) ) (supervisor ?x ?y))

;;; Query results:

;;this filters all computer programmers
;;all are computer programmers, so nothing is passed to the 'and'
;;and the result is empty


;b=======================================
;;; Query input:
(wheel ?who)

;;; Query results:
(wheel (Warbucks Oliver))
(wheel (Warbucks Oliver))
(wheel (Bitdiddle Ben))
(wheel (Warbucks Oliver))
(wheel (Warbucks Oliver))

;;Oliver is the supervisor to supervisors, so he is listed 4 times
;c===========================================
;;; Query input:
(outranked-by (Bitdiddle Ben) ?who)

;;; Query results:
(outranked-by (Bitdiddle Ben) (Warbucks Oliver))
;;; Query input:
(assert!(rule(***outranked-by ?staff ?boss) (or(supervisor ?staff ?boss) (and(***outranked-by ?middle-manager ?boss) (supervisor ?staff ?middle-manager)))))

Assertion added to data base.
;;; Query input:
(***outranked-by (Bitdiddle Ben) (Warbucks Oliver))

;;; Query results:
(***outranked-by (Bitdiddle Ben) (Warbucks Oliver))
;;After this output, which is the same as before, there is an infinite loop, as the new rule added by the last
;;assert created undefined bindings


;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<PROBLEM 5>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; Query input:
(assert! (rule (comma (<comma> . ?x) ?x (comma <comma>))))
(assert! (rule (conj (and . ?x) ?x (conj and))))
(assert! (rule (noun (wabe . ?x) ?x (noun wabe))))
(assert! (rule (adj (slithy . ?x) ?x (adj slithy))))
(assert! (rule (adj (mimsy . ?x) ?x (adj mimsy))))
(assert! (rule (adj (mome . ?x) ?x (adj mome))))
(assert! (rule (adj (brillig . ?x) ?x (adj brillig))))
(assert! (rule (art (the . ?x) ?x (art the))))
(assert! (rule (adjP ?x ?y ?a) (adj ?x ?y ?a)))
(assert! (rule (aux (Did . ?x) ?x (aux Did))))
(assert! (rule (prep (in . ?x) ?x (prep in))))
(assert! (rule (N&V (Twas . ?x) ?x (N&V twas))))
(assert! (rule (semicolon (<semicolon> . ?x) ?x (semicolon <semicolon>))))
(assert! (rule (adv (All . ?x) ?x (adv All))))
(assert! (rule (inverb (were . ?x) ?x (inverb were))))
(assert! (rule (noun (borogoves . ?x) ?x (noun borogoves))))
(assert! (rule (noun (toves . ?x) ?x (noun toves))))
(assert! (rule (noun (raths . ?x) ?x (noun raths))))
(assert! (rule (verb (outgrabe . ?x) ?x (verb outgrabe))))
(assert! (rule (verb (gyre . ?x) ?x (verb gyre))))
(assert! (rule (verb (gimble . ?x) ?x (verb gimble))))
(assert! (rule (period (<period> . ?x) ?x (period <period>))))
(assert! (rule (conj (And . ?x) ?x (conj And))))
(assert! (rule (N&VP ?x ?y ?a) (N&V ?x ?y ?a)))
(assert! (rule (np ?x ?z (np ?a ?b)) (and (art ?x ?y ?a) (ng ?y ?z ?b))))
(assert! (rule (ng ?x ?z (ng ?a ?b)) (and (adj ?x ?y ?a) (noun ?y ?z ?b))))
(assert! (rule (vg ?x ?z (vg ?a ?b)) (and (aux ?x ?y ?a) (vc ?y ?z ?b))))
(assert! (rule (vg ?x ?u (vg ?a ?b ?c)) (and (aux ?x ?y ?a) (vc ?y ?z ?b) (pp ?z ?u ?c))))
(assert! (rule (ng ?x ?y (ng ?a)) (noun ?x ?y ?a)))
(assert! (rule (vc ?x ?u (vc ?a ?b ?c)) (and (verb ?x ?y ?a) (conj ?y ?z ?b) (V&PP ?z ?u ?c))))
(assert! (rule (vc ?x ?u (vc ?a ?b ?c)) (and (verb ?x ?y ?a) (conj ?y ?z ?b) (verb ?z ?u ?c))))
(assert! (rule (V&PP ?x ?z (V&PP ?a ?b)) (and (verb ?x ?y ?a) (pp ?y ?z ?b))))
(assert! (rule (pp ?x ?z (pp ?a ?b)) (and (prep ?x ?y ?a) (np ?y ?z ?b))))
(assert! (rule (preadj ?x ?z (preadj ?a ?b)) (and (adv ?x ?y ?a) (adj ?y ?z ?b))))
(assert! (rule (sent ?x ?z (sent ?a ?b)) (and (N&VP ?x ?y ?a) (adjP ?y ?z ?b))))
(assert! (rule (sent ?x ?z (sent ?a ?b)) (and (np ?x ?y ?a) (vg ?y ?z ?b))))
(assert! (rule (sent ?x ?z (sent ?a ?b)) (and (np ?x ?y ?a) (verb ?y ?z ?b))))
(assert! (rule (sent ?x ?u (sent ?a ?b ?c)) (and (preadj ?x ?y ?a) (inverb ?y ?z ?b) (np ?z ?u ?c))))
(assert! (rule (sent-conj ?x ?z (sent-conj ?a ?b)) (and (comma ?x ?y ?a) (conj ?y ?z ?b))))
(assert! (rule (sent2 ?x ?u (?a ?b ?c)) (and (sent ?x ?y ?a) (sent-conj ?y ?z ?b) (sent ?z ?u ?c))))
(assert! (rule (sent2p ?x ?z (?a ?b)) (and (sent2 ?x ?y ?a) (period ?y ?z ?b))))
(assert! (rule (sent4 ?x ?u (sent4 ?a ?b ?c)) (and (sent2 ?x ?y ?a) (semicolon ?y ?z ?b) (sent2p ?z ?u ?c))))
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
Assertion added to data base.
;;; Query input:
(sent4 (Twas brillig <comma> and the slithy toves Did gyre and gimble in the wabe <semicolon> All mimsy were the borogoves <comma> And the mome raths outgrabe <period>) () ?answer)

;;; Query results:
(sent4 (Twas brillig <comma> and the slithy toves Did gyre and gimble in the wabe <semicolon> All mimsy were the borogoves <comma> And the mome raths outgrabe <period>) () (sent4 ((sent (N&V twas) (adj brillig)) (sent-conj (comma <comma>) (conj and)) (sent (np (art the) (ng (adj slithy) (noun toves))) (vg (aux Did) (vc (verb gyre) (conj and) (V&PP (verb gimble) (pp (prep in) (np (art the) (ng (noun wabe))))))))) (semicolon <semicolon>) (((sent (preadj (adv All) (adj mimsy)) (inverb were) (np (art the) (ng (noun borogoves)))) (sent-conj (comma <comma>) (conj And)) (sent (np (art the) (ng (adj mome) (noun raths))) (verb outgrabe))) (period <period>))))
(sent4 (Twas brillig <comma> and the slithy toves Did gyre and gimble in the wabe <semicolon> All mimsy were the borogoves <comma> And the mome raths outgrabe <period>) () (sent4 ((sent (N&V twas) (adj brillig)) (sent-conj (comma <comma>) (conj and)) (sent (np (art the) (ng (adj slithy) (noun toves))) (vg (aux Did) (vc (verb gyre) (conj and) (verb gimble)) (pp (prep in) (np (art the) (ng (noun wabe))))))) (semicolon <semicolon>) (((sent (preadj (adv All) (adj mimsy)) (inverb were) (np (art the) (ng (noun borogoves)))) (sent-conj (comma <comma>) (conj And)) (sent (np (art the) (ng (adj mome) (noun raths))) (verb outgrabe))) (period <period>))))


;;;======================================================
;;;   Youtube Expert System ( Vlogger )
;;;
;;;     This expert system help choose
;;;     problems with a choose youtube canal
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule start

   (logical (start))

   =>

   (assert (UI-state (display Choose)
                     (relation-asserted choose)
                     (response Vlogger)
                     (valid-answers Vlogger))))

(defrule watch-collab "Początek"

   (logical (choose Vlogger))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted collab-single)
                     (response Collab)
                     (valid-answers Collab Single))))
   
(defrule new-film "1 P New"

   (logical (collab-single Collab))

   =>

   (assert (UI-state (display AgeQuestion)
                     (relation-asserted old-new)
                     (response New)
                     (valid-answers New Old))))

(defrule determine-rotation-state "2 P "

   (logical (old-new New))

   =>

   (assert (UI-state (display RelationQuestion)
                     (relation-asserted relation)
                     (response Sick)
                     (valid-answers Sick Happy))))
   
(defrule determine-sluggishness "Question about Dr Who - What`s that"

   (logical (relation Sick))

   =>

   (assert (UI-state (display SluggishQuestion)
                     (relation-asserted likes-Dr-Who)
                     (response What)
                     (valid-answers What Absolutely))))

(defrule how-many-two "How many people do you want to watch ?  - two"

   (logical (likes-Dr-Who What))

   =>

   (assert (UI-state (display HowManyQuestion)
                     (relation-asserted how-many)
                     (response Two)
                     (valid-answers Five Two))))
   
(defrule determine-misfiring "Do you want to watch short or tail people ? - tail"

   (logical (how-many Two))

   =>

   (assert (UI-state (display MisfireQuestion)
                     (relation-asserted type)
                     (response Tail)
                     (valid-answers Tail Short))))

(defrule determine-knocking "Sex - girl ? - girl"

   (logical (type Tail))

   =>

   (assert (UI-state (display KnockQuestion)
                     (relation-asserted sex)
                     (response Girls)
                     (valid-answers Girls Boys))))

(defrule determine-low-output "Girls or boys ? - Boys"

   (logical (type Tail))

   =>

   (assert (UI-state (display KnockQuestion)
                     (relation-asserted sex)
                     (response Boys)
                     (valid-answers Girls Boys))))

(defrule how-many-five "How many people do you want to watch ?  - five"

   (logical (likes-Dr-Who What))

   =>

   (assert (UI-state (display MisfireQuestion)
                     (relation-asserted how-many)
                     (response Five)
                     (valid-answers Five Two))))

(defrule likes-DrWho "Question about Dr Who - What`s that"

   (logical (relation Sick))

   =>

   (assert (UI-state (display SluggishQuestion)
                     (relation-asserted likes-Dr-Who)
                     (response Absolutely)
                     (valid-answers What Absolutely))))

(defrule relation-happy "2 P "

   (logical (old-new New))

   =>

   (assert (UI-state (display RelationQuestion)
                     (relation-asserted relation)
                     (response Happy)
                     (valid-answers Sick Happy))))

(defrule old-film "1 P Old"

   (logical (collab-single Collab))

   =>

   (assert (UI-state (display AgeQuestion)
                     (relation-asserted old-new)
                     (response Old)
                     (valid-answers New Old))))

(defrule watch-single "Początek"

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted collab-single)
                     (response Single)
                     (valid-answers Collab Single))))

(defrule what-kind-of-accent "qestion: What kind of accent do you like ?"

   (logical (collab-single Single))

   =>

   (assert (UI-state (display What-kind-of-accent)
                     (relation-asserted what-kind )
                     (response British)
                     (valid-answers British American Something-else))))

(defrule do-you-find-David-Tennant-attractive-No

   (logical (what-kind British))

   =>

   (assert (UI-state (display Do-you-find-David-Tennant-atrractive)
                     (relation-asserted attractive-David )
                     (response No)
                     (valid-answers Duh No))))

(defrule boys-play-instrumental-hot-No

   (logical (attractive-David No))

   =>

   (assert (UI-state (display Question-boys-play-instrumental-hot)
                     (relation-asserted instrumental-hot )
                     (response No)
                     (valid-answers Yes No))))

(defrule do-you-prefer-scripted-or-spontaneous-video-Spontaneous

   (logical (instrumental-hot No))

   =>

   (assert (UI-state (display Do-you-prefer)
                     (relation-asserted prefer )
                     (response Spontaneous)
                     (valid-answers Spontaneous Scripted))))

(defrule do-you-prefer-scripted-or-spontaneous-video-Scripted

   (logical (instrumental-hot No))

   =>

   (assert (UI-state (display Do-you-prefer)
                     (relation-asserted prefer )
                     (response Scripted)
                     (valid-answers Spontaneous Scripted))))

(defrule boys-play-instrumental-hot-Yes

   (logical (attractive-David No))

   =>

   (assert (UI-state (display Question-boys-play-instrumental-hot)
                     (relation-asserted instrumental-hot )
                     (response Yes)
                     (valid-answers Yes No))))

(defrule do-you-hate-Twilight-Yes

   (logical (instrumental-hot Yes))

   =>

   (assert (UI-state (display Do-you-hate-Twilight)
                     (relation-asserted hate-Twilight )
                     (response Yes)
                     (valid-answers Yes Don`t_Care No))))

(defrule do-you-hate-Twilight-Don`t_Care

   (logical (instrumental-hot Don`t_Care))

   =>

   (assert (UI-state (display Do-you-hate-Twilight)
                     (relation-asserted hate-Twilight )
                     (response Don`t_Care)
                     (valid-answers Yes Don`t_Care No))))

(defrule do-you-hate-Twilight-No

   (logical (instrumental-hot No))

   =>

   (assert (UI-state (display Do-you-hate-Twilight)
                     (relation-asserted hate-Twilight )
                     (response No)
                     (valid-answers Yes Don`t_Care No))))

(defrule do-you-find-David-Tennant-attractive-Duh

   (logical (what-kind British))

   =>

   (assert (UI-state (display Do-you-find-David-Tennant-atrractive)
                     (relation-asserted attractive-David )
                     (response Duh)
                     (valid-answers Duh No))))

(defrule canada-cool-right-Yeah

   (logical (what-kind Something-else))

   =>

   (assert (UI-state (display Canada-cool-right)
                     (relation-asserted canada )
                     (response Yeah)
                     (valid-answers Yeah Sucks)))))

(defrule canada-cool-right-Sucks

   (logical (what-kind Something-else))

   =>

   (assert (UI-state (display Canada-cool-right)
                     (relation-asserted Canada )
                     (response Sucks)
                     (valid-answers Yeah Sucks))))

(defrule which-is-funnier-Chickens

   (logical (canada Sucks))

   =>

   (assert (UI-state (display Which-is-funnier)
                     (relation-asserted funnier )
                     (response Chickens)
                     (valid-answers Chickens Humor))))

(defrule which-is-funnier-Humor

   (logical (canada Sucks))

   =>

   (assert (UI-state (display Which-is-funnier)
                     (relation-asserted funnier )
                     (response Humor)
                     (valid-answers Chickens Humor))))

(defrule what-kind-of-accent "qestion: What kind of accent do you like ?"

   (logical (collab-single Single))

   =>

   (assert (UI-state (display What-kind-of-accent)
                     (relation-asserted what-kind )
                     (response American)
                     (valid-answers British American Something-else))))

(defrule someone-who-Somethimes-sings

   (logical (what-kind American))

   =>

   (assert (UI-state (display Someone-who-sing)
                     (relation-asserted sing )
                     (response Somethimes-sings)
                     (valid-answers Somethimes-sings Never-sings))))

(defrule do-you-like-rapping

   (logical (sing Somethimes-sings))

   =>

   (assert (UI-state (display Do-you-like-rapping)
                     (relation-asserted like-rapping )
                     (response Yes)
                     (valid-answers Yes No))))

(defrule do-you-like-rapping

   (logical (sing Somethimes-sings))

   =>

   (assert (UI-state (display Do-you-like-rapping)
                     (relation-asserted like-rapping )
                     (response No)
                     (valid-answers Yes No))))

(defrule do-you-only-like-songs-about-breakfast-Of-course

   (logical (like-rapping No))

   =>

   (assert (UI-state (display Do-you-only-like-songs-about-breakfast)
                     (relation-asserted about-breakfast )
                     (response Of-course)
                     (valid-answers Of-course Um-no))))

(defrule do-you-only-like-songs-about-breakfast-No

   (logical (like-rapping No))

   =>

   (assert (UI-state (display Do-you-only-like-songs-about-breakfast)
                     (relation-asserted about-breakfast )
                     (response Um-no)
                     (valid-answers Of-course Um-no))))

(defrule graphs-and-charts-charts-Yes

   (logical (about-breakfast Um-no))

   =>

   (assert (UI-state (display Do-you-like-graphs-and-charts)
                     (relation-asserted like-graphs-and-charts )
                     (response Yes!)
                     (valid-answers Yes! Not-really))))

(defrule graphs-and-charts-charts-No

   (logical (about-breakfast Um-no))

   =>

   (assert (UI-state (display Do-you-like-graphs-and-charts)
                     (relation-asserted like-graphs-and-charts )
                     (response Not-really)
                     (valid-answers Yes! Not-really))))

(defrule Do-you-love-all-caps-Yes

   (logical (like-graphs-and-charts Not-really))

   =>

   (assert (UI-state (display Do-you-love-all-caps)
                     (relation-asserted love-all-caps )
                     (response Yes)
                     (valid-answers Yes Not-my-style))))

(defrule Do-you-love-all-caps-No

   (logical (like-graphs-and-charts Not-really))

   =>

   (assert (UI-state (display Do-you-love-all-caps)
                     (relation-asserted love-all-caps )
                     (response Not-my-style)
                     (valid-answers Yes Not-my-style))))

(defrule Do-girls-or-boys-rule-Girls

   (logical (love-all-caps Yes))

   =>

   (assert (UI-state (display Do-girls-or-boys-rule)
                     (relation-asserted do-rule )
                     (response Girls!)
                     (valid-answers Girls! Boys!))))

(defrule Do-girls-or-boys-rule-Boys

   (logical (love-all-caps Yes))

   =>

   (assert (UI-state (display Do-girls-or-boys-rule)
                     (relation-asserted do-rule )
                     (response Boys!)
                     (valid-answers Girls! Boys!))))

(defrule do-you-insist-on-watching-a-fiveawesomegirl-Yes

   (logical (love-all-caps Not-my-style))

   =>

   (assert (UI-state (display Do-you-insist-on-watching-a-fiveawesomegirl)
                     (relation-asserted insist)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule do-you-insist-on-watching-a-fiveawesomegirl-Smile

   (logical (love-all-caps Not-my-style))

   =>

   (assert (UI-state (display Do-you-like-really-really-happy-people)
                     (relation-asserted insist)
                     (response Smile)
                     (valid-answers Smile Sadness))))

(defrule do-you-like-really-really-happy-people-Sadness

   (logical (insist No))

   =>

   (assert (UI-state (display Do-you-like-really-really-happy-people)
                     (relation-asserted like-happy-people)
                     (response Sadness)
                     (valid-answers Smile Sadness))))

(defrule when-not-singing-you-want-your-vlogger-to-Talk-fast

   (logical (like-happy-people Sadness))

   =>

   (assert (UI-state (display When-not-singing-you-want-your-vlogger-to)
                     (relation-asserted talk)
                     (response Fast)
                     (valid-answers Fast Slow))))

(defrule when-not-singing-you-want-your-vlogger-to-Talk-slow

   (logical (like-happy-people Sadness))

   =>

   (assert (UI-state (display When-not-singing-you-want-your-vlogger-to)
                     (relation-asserted talk)
                     (response Slow)
                     (valid-answers Fast Slow))))

(defrule your-prefer-vlogger-to-review-Technology

   (logical (talk Slow))

   =>

   (assert (UI-state (display You-prefer-vlogger-to-review)
                     (relation-asserted review)
                     (response Technology)
                     (valid-answers Technology Books))))

(defrule your-prefer-vlogger-to-review-Books

   (logical (talk Slow))

   =>

   (assert (UI-state (display You-prefer-vlogger-to-review)
                     (relation-asserted review)
                     (response Books)
                     (valid-answers Technology Books))))

(defrule someone-who-Never-sings

   (logical (what-kind American))

   =>

   (assert (UI-state (display Someone-who-sing)
                     (relation-asserted sing)
                     (response Never-sings)
                     (valid-answers Somethimes-sings Never-sings))))

(defrule do-you-want-dayly-video-Yes

   (logical (sing Never-sings))

   =>

   (assert (UI-state (display Do-you-want-dayly-video)
                     (relation-asserted dayly-video)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule do-you-want-dayly-video-No

   (logical (sing Never-sings))

   =>

   (assert (UI-state (display Do-you-want-dayly-video)
                     (relation-asserted dayly-video)
                     (response No)
                     (valid-answers Yes No))))

(defrule do-you-need-avice-Yes-please

   (logical (dayly-video No))

   =>

   (assert (UI-state (display Do-you-need-avice)
                     (relation-asserted need-avice)
                     (response Yes-please)
                     (valid-answers Yes-please No))))

(defrule do-you-need-avice-No

   (logical (dayly-video No))

   =>

   (assert (UI-state (display Do-you-need-avice)
                     (relation-asserted need-avice)
                     (response No)
                     (valid-answers Yes-please No))))

(defrule do-you-like-seeing-Yes

   (logical (need-avice No))

   =>

   (assert (UI-state (display Do-you-like-seeing)
                     (relation-asserted like-seeing)
                     (response Yes)
                     (valid-answers Yes No-thats-weird))))

(defrule do-you-like-seeing-No-thats-weird

   (logical (need-avice No))

   =>

   (assert (UI-state (display Do-you-like-seeing)
                     (relation-asserted like-seeing)
                     (response No-thats-weird)
                     (valid-answers Yes No-thats-weird))))

(defrule how-many-subscripted-Less-than-100,000

   (logical (like-seeing No-thats-weird))

   =>

   (assert (UI-state (display How-many-subscripted)
                     (relation-asserted many-subscripted)
                     (response <100000)
                     (valid-answers <100000 >100000))))

(defrule how-many-subscripted-More-than-100,000

   (logical (like-seeing No-thats-weird))

   =>

   (assert (UI-state (display How-many-subscripted)
                     (relation-asserted many-subscripted)
                     (response >100000)
                     (valid-answers <100000 >100000))))

(defrule do-you-want-to-watch-someone...-Talk

   (logical (many-subscripted >100000))

   =>

   (assert (UI-state (display Do-you-want-to-watch-someone...)
                     (relation-asserted want-to-watch)
                     (response Talk)
                     (valid-answers Talk Put Rant))))

(defrule do-you-want-to-watch-someone...-Put

   (logical (many-subscripted >100000))

   =>

   (assert (UI-state (display Do-you-want-to-watch-someone...)
                     (relation-asserted want-to-watch)
                     (response Put)
                     (valid-answers Talk Put Rant))))

(defrule do-you-want-to-watch-someone...-Rand

   (logical (many-subscripted >100000))

   =>

   (assert (UI-state (display Do-you-want-to-watch-someone...)
                     (relation-asserted want-to-watch)
                     (response Rant)
                     (valid-answers Talk Put Rant))))

(defrule typography-is-cool-Agreed

   (logical (many-subscripted <100000))

   =>

   (assert (UI-state (display Typography-is-cool)
                     (relation-asserted typography-is-cool)
                     (response Agreed)
                     (valid-answers Agreed What's))))

(defrule typography-is-cool-What's

   (logical (many-subscripted <100000))

   =>

   (assert (UI-state (display Typography-is-cool)
                     (relation-asserted typography-is-cool)
                     (response What's)
                     (valid-answers Agreed What's))))

(defrule do-you-only-watch-fivesomes-Yes

   (logical (typography-is-cool What's))

   =>
   (assert (UI-state (display Do-you-only-watch-fiveawesomes)
                     (relation-asserted only-watch-fivewaesomes)
                     (response Yes)
                     (valid-answers Yes Who-are-they))))

(defrule do-you-only-watch-fivesomes-Who-are-they

   (logical (typography-is-cool What's))

   =>
   (assert (UI-state (display Do-you-only-watch-fiveawesomes)
                     (relation-asserted only-watch-fivewaesomes)
                     (response Who-are-they)
                     (valid-answers Yes Who-are-they))))

(defrule girls-or-boys-rule-Boys

   (logical (only-watch-fivewaesomes Yes))

   =>

   (assert (UI-state (display Girls-or-boys)
                     (relation-asserted girls-or-boys )
                     (response Boys)
                     (valid-answers Girls Boys))))

(defrule girls-or-boys-rule-Girls

   (logical (only-watch-fivewaesomes Yes))

   =>

   (assert (UI-state (display Girls-or-boys)
                     (relation-asserted girls-or-boys )
                     (response Girls)
                     (valid-answers Girls Boys))))

(defrule only-watch-fivewaesomes

   (logical (only-watch-fivewaesomes Who-are-they))

   =>

   (assert (UI-state (display You-sure-a-picky)
                     (relation-asserted you-sure-a-picky )
                     (response Yup)
                     (valid-answers Yup))))

;;;****************
;;;* Answers rules *
;;;****************

(defrule normal-engine-state-conclusions "Girl"

   (logical (sex Girls))
   
   =>

   (assert (UI-state (display Sistersalad)
                     (state final))))

(defrule engine-sluggish "Boys"

   (logical (sex Boys))
   
   =>

   (assert (UI-state (display Vlogbrothers)
                     (state final))))

(defrule answer-short "Short"

   (logical (type Short))

   =>

   (assert (UI-state (display Shortsisters756)
                     (state final))))

(defrule answer-many-people "Five"

   (logical (how-many Five))

   =>

   (assert (UI-state (display Fiveawesomegirls)
                     (state final))))

(defrule answer-how-like-DrWho

   (logical (likes-Dr-Who Absolutely))

   =>

   (assert (UI-state (display Tardistacular)
                     (state final))))

(defrule relation-happy

   (logical (relation Happy))

   =>
   (assert (UI-state (display Vlogvlovers)
                     (state final))))

(defrule old-new-film

   (logical (old-new Old))

   =>
   (assert (UI-state (display Fiveawesomeguys)
                     (state final))))

(defrule answer-Spontaneous

   (logical (prefer Spontaneous))

   =>
   (assert (UI-state (display Missxroyas)
                     (state final))))

(defrule answer-Scripted

   (logical (prefer Scripted))

   =>
   (assert (UI-state (display Elecricfearbiedust)
                     (state final))))

(defrule answer-hate-Twilight-Yes

   (logical (hate-Twilight Yes))

   =>
   (assert (UI-state (display Nerimon)
                     (state final))))

(defrule answer-hate-Twilight-Don`t_Care

   (logical (hate-Twilight Don`t_Care))

   =>
   (assert (UI-state (display Charliessocoollike)
                     (state final))))

(defrule answer-hate-Twilight-No

   (logical (hate-Twilight No))

   =>
   (assert (UI-state (display Get_out_of_my_flowchart)
                     (state final))))

(defrule answer-attractive-David-Duh

   (logical (attractive-David Duh))

   =>
   (assert (UI-state (display Littleradge)
                     (state final))))

(defrule canada-right-Yeah

   (logical (canada Yeah))

   =>
   (assert (UI-state (display Gunarolla)
                     (state final))))

(defrule funnier-Chikiens

   (logical (funnier Chickens))

   =>
   (assert (UI-state (display Robofillet)
                     (state final))))

(defrule funnier-Humor

   (logical (funnier Humor))

   =>
   (assert (UI-state (display Communitychannel)
                     (state final))))

(defrule like-rapping-Yes

   (logical (like-rapping Yes))

   =>
   (assert (UI-state (display Hayleygoover)
                     (state final))))

(defrule about-breakfast-Of-course

   (logical (about-breakfast Of-course))

   =>
   (assert (UI-state (display Wheezywaiter)
                     (state final))))

(defrule like-graphs-and-charts

   (logical (like-graphs-and-charts Yes!))

   =>
   (assert (UI-state (display Mickeleh)
                     (state final))))

(defrule do-rule-girls

   (logical (do-rule Girls!))

   =>
   (assert (UI-state (display Italktosnakes)
                     (state final))))

(defrule do-rule-boys

   (logical (do-rule Boys!))

   =>
   (assert (UI-state (display Lukeconard)
                     (state final))))

(defrule insist-Yes

   (logical (insist Yes))

   =>
   (assert (UI-state (display Divilishlypure)
                     (state final))))

(defrule like-happy-people-Yes

   (logical (like-happy-people Smile))

   =>
   (assert (UI-state (display Hopeonatenspeed)
                     (state final))))

(defrule talk-fast

   (logical (talk Fast))

   =>
   (assert (UI-state (display Fizzylimon)
                     (state final))))

(defrule review-technology

   (logical (review Technology))

   =>
   (assert (UI-state (display Ijustine)
                     (state final))))

(defrule review-books

   (logical (review Books))

   =>
   (assert (UI-state (display Bandgeek8408)
                     (state final))))

(defrule dayly-yes

   (logical (dayly-video Yes))

   =>
   (assert (UI-state (display Breakingnyc)
                     (state final))))

(defrule need-avice-yes-please

   (logical (need-avice Yes-please))

   =>
   (assert (UI-state (display Peron75)
                     (state final))))

(defrule like-seeing-Yes

   (logical (like-seeing Yes))

   =>
   (assert (UI-state (display Elmify)
                     (state final))))

(defrule want-to-watch-talk

   (logical (want-to-watch Talk))

   =>
   (assert (UI-state (display Pogobat)
                     (state final))))

(defrule want-to-watch-put

   (logical (want-to-watch Put))

   =>
   (assert (UI-state (display Michellephan)
                     (state final))))

(defrule want-to-watch-rant

   (logical (want-to-watch Rant))

   =>
   (assert (UI-state (display Meekakitty)
                     (state final))))

(defrule what's-typography

   (logical (typography-is-cool Agreed))

   =>
   (assert (UI-state (display Xperpertualmotion)
                     (state final))))


(defrule boys

   (logical (girls-or-boys Boys))

   =>
   (assert (UI-state (display Alanvlogs)
                     (state final))))

(defrule girls

   (logical (girls-or-boys Girls))

   =>
   (assert (UI-state (display Owlssayhoot)
                     (state final)))))

(defrule yup

   (logical (you-sure-a-picky Yup))

   =>
   (assert (UI-state (display Thatzak)
                     (state final))))

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   

/* 
? 1 : 
* Ans : we dont use the secret key in flutter bcz attackers will use our secret key for chaging money and our violat will be clean . so we creat payment intent form backend side using secret key which is secure and return paymentintetn id to fllutter for initalize paymentsheet . 

? 2 : 
* Ans: from frontend side we should not mark as payment succesffull and we dont rely on frontend side . it only confrims thorugh webhooks on backend side and after succeed in webhooks we show dilaog payment is successfull . the flow is when create payment intent it returns us id and we create paymentsheet it requirs method , 3d securing , after adding card detail etc it processes and here on backend side web hooks works and give us succeed event if process compelte and then stripe return to backend event then it return to flutter and we show confirmation. 


? 3: 
* Ans: the webhooks does solve the problem of confirming the payment is success or fail dont forntend . 

? 4 : 
* Ans: when user use secure card like visa hten pay it moves to one next page where user comfirm taht paymnet or cancel as he want . and then it shows presentpaymentsheet. 

? 5 : 
! requires_payment_method : 
* this method is occuring after creating paymentintent and opening sheet . here paymentinent wil create but not selected any method by user and bcz user cancel payment .
! requires_action :
* after select mehotd here required 3d action for confirming payment . 
! processing : 
* after confirming action the processing starts here stripe uses webhooks and send succeedd after geting succeed event form webhooks .
! succeeded : 
* after processing if payment succeed it return succeed event  .  

? 6 : 
* i have no ans for 6 and 7 bcz i does not learn now these two things in deeply like setupintent 

? 8 :
* Ans: we use metadata in paymentintent for giving arguments that confirm  which property user select for paying . 

? 9: 
* i have no idea for this question 

? 10 :
* when we run backend on local and use emulator for that then the 10.0.2.2 works for localy but not for real device bcz our device connects wiht wireless connection and we have to pass system ip adddres for sharing data on real device . 

? 11 : 
* Ans: i have no idea for this. explain me  

*/
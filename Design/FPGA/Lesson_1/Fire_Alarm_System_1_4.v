module Fire_Alarm_System_1_4(input En,A,B,C,output F);
assign F= (A&B | A&C|B&C)&En;
endmodule 
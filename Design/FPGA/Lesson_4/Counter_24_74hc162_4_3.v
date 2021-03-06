module Counter_24_74hc162_4_3(input En,CLK,output A0,A1,A2,A3,A4,A5);
wire temp_CR0,temp_RC0;
assign temp_CR0=~(A5&A2);

//Decimal_Synchronous_Addition_Counter_74hc162_4_1    DSAC_41_1(temp_CR0 ,1,CLK,1,1,0,0,0,0,A0,A1,A2,A3,temp_RC0);
//Decimal_Synchronous_Addition_Counter_74hc162_4_1    DSAC_41_2(temp_CR0,1,~temp_RC0,1,1,0,0,0,0,A4,A5,temp_Q2,temp_Q3,temp_R);
Decimal_Synchronous_Addition_Counter_74hc162_4_1_Correct    DSAC_41_2(En,~temp_RC0,temp_CR0,1,1,1,0,0,0,0,A4,A5);
Decimal_Synchronous_Addition_Counter_74hc162_4_1_Correct    DSAC_41_1(En,CLK,temp_CR0,1,1,1,0,0,0,0,A0,A1,A2,A3,temp_RC0);

																												
endmodule 
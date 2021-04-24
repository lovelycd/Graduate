module Pentadecimal_Counter_74hc162_4_2(input En,CLK,output A0,A1,A2);
wire temp_A0,temp_A1,temp_A2;
Decimal_Synchronous_Addition_Counter_74hc162_4_1    DSAC_162_41_1(En,CLK,~temp_A2,1,1,1,0,0,0,0,temp_A0,temp_A1,temp_A2);
assign A0=En&temp_A0;
assign A1=En&temp_A1;
assign A2=En&temp_A2;
endmodule 
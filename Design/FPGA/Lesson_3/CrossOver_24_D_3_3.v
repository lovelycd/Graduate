module CrossOver_24_D_3_3(input CLK,output Q1,Q2);
wire temp_Q00,temp_Q10;
D_Trigger_3_2   DT_32_1( 1,CLK,temp_Q00,1,1,Q1,temp_Q00);
D_Trigger_3_2   DT_32_2( 1,Q1,temp_Q10,1,1, Q2,temp_Q10);
endmodule 
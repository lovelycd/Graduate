module Decimal_Synchronous_Addition_Counter_74hc162_4_1(En,CLK,CR0,LD0,EP,ET,D0,D1,D2,D3,Q0,Q1,Q2,Q3,RCO);
input  En,CR0,LD0,CLK,EP,ET,D0,D1,D2,D3;
output Q0,Q1,Q2,Q3,RCO;
reg temp_Q0,temp_Q1,temp_Q2,temp_Q3,temp_RCO;
always @(posedge CLK) begin
	if(~CR0) 	{temp_RCO,temp_Q3,temp_Q2,temp_Q1,temp_Q0}=5'b0;
	else if(~LD0)  begin
											{temp_Q3,temp_Q2,temp_Q1,temp_Q0}={D3,D2,D1,D0};
											if(ET&({temp_Q3,temp_Q2,temp_Q1,temp_Q0}==4'b1001))  temp_RCO=1;
											else temp_RCO=0;
									end
	else if(EP&ET) begin
											if(temp_RCO) begin
																{temp_Q3,temp_Q2,temp_Q1,temp_Q0}=4'b0000;
																temp_RCO=0;
															end
											else  	begin											
																{temp_Q3,temp_Q2,temp_Q1,temp_Q0}={temp_Q3,temp_Q2,temp_Q1,temp_Q0}+4'b0001;
																if(ET&({temp_Q3,temp_Q2,temp_Q1,temp_Q0}==4'b1001))  temp_RCO=1;
															end
									end
end
assign Q0=En&temp_Q0;
assign Q1=En&temp_Q1;
assign Q2=En&temp_Q2;
assign Q3=En&temp_Q3;
assign RCO=En&temp_RCO;
endmodule 
module D_Trigger_3_2( En,CLK,D,Rd0,Sd0, Q,Q0);
input CLK,D,Rd0,Sd0,En;
reg temp_Q;
wire temp_Q0;
output Q,Q0;
always @(negedge Rd0 or negedge Sd0 or posedge CLK)
	begin
	if(~Rd0) 
			temp_Q=0;
	else if(~Sd0)
			temp_Q=1;
	else if(CLK)
			temp_Q=D;
	end
assign temp_Q0=~temp_Q;
assign Q0=temp_Q0&En;
assign Q=temp_Q&En;
endmodule 
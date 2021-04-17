module JK_Trigger_3_4(input En,CLK,J,K,Rd0,Sd0,output Q,Q0);

reg temp_Q=0;

always @(negedge Rd0 or negedge Sd0 or negedge CLK) begin
	if(~Rd0)  temp_Q=0;
	else if(~Sd0) temp_Q=1;
	else begin
		case({J,K})
			2'b00:	temp_Q<=temp_Q;
			2'b01:	temp_Q<=0;
			2'b10:	temp_Q<=1;
			2'b11:	temp_Q<=~temp_Q;
		endcase
	end
end

assign Q=temp_Q&En;
assign Q0=~temp_Q&En;
endmodule 
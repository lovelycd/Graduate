module Design_Of_Graduation(input [7:0] select,output   En_11,En_12,En_13,En_14,En_15,
	En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29,
	En_31,En_32,En_33,En_34,En_35,En_36,
	En_41,En_42,En_43,En_44,En_45,En_46);

expe_select asdfasd(select[7:0],En_11,En_12,En_13,En_14,En_15,
	En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29,
	En_31,En_32,En_33,En_34,En_35,En_36,
	En_41,En_42,En_43,En_44,En_45,En_46);







//module Design_Of_Graduation(tclk,RXD,DATA_R ,intr_rcive,logic_output);

//input tclk,RXD;
//output  [7:0] DATA_R;
//output intr_rcive;
//
//output reg [15:0] logic_output=0;
// 
// reg  [2:0] n_byte=0; 
// reg [15:0] logic_input;		//閫昏緫杈撳叆
// reg [7:0] exp_selc;		//瀹為獙閫夋嫨
// reg trans_finish=0; 
//
//
//
//UART_R wesdfgh(tclk,115200,RXD,DATA_R,intr_rcive);
//
//always @(posedge intr_rcive) begin
//	   case(n_byte)
//			3'b000:	if(DATA_R!=8'hAA) n_byte=0;else begin  n_byte=n_byte+1;trans_finish=0;end
//			3'b001:	begin exp_selc=DATA_R;n_byte=n_byte+1; end
//			3'b010:	begin logic_input[15:8]=DATA_R;n_byte=n_byte+1;end
//			3'b011:	begin logic_input[7:0]=DATA_R;n_byte=n_byte+1;end
//			3'b100:  begin if(DATA_R==8'h55) begin n_byte=0;trans_finish=1;end else n_byte=0;  end
//			default : n_byte=0;
//		endcase
//end
//
//reg En_11,En_12,En_13,En_14,En_15;
//reg En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29;
//reg En_31,En_32,En_33,En_34,En_35,En_36;
//reg En_41,En_42,En_43,En_44,En_45,En_46;
//wire output_1_11;
//And_Not_Gate_1_1 asdfaadfswefa(En_11,logic_input[0],logic_input[1],output_1_11);
//
//always @(posedge trans_finish)
//		case(exp_selc)
//			8'h11:  begin    En_11=1;logic_output[0]=output_1_11;              end
//		endcase

endmodule 
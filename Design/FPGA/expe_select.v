module expe_select(input [7:0] select,output  En_11,En_12,En_13,En_14,En_15,
	En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29,
	En_31,En_32,En_33,En_34,En_35,En_36,
	En_41,En_42,En_43,En_44,En_45,En_46);
	
	assign En_11=	(~select[7])&(~select[6])&(~select[5])&(select[4])&(~select[3])&(~select[2])&(~select[1])&(select[0]);
	assign En_12=	(~select[7])&(~select[6])&(~select[5])&(select[4])&(~select[3])&(~select[2])&(select[1])&(~select[0]);
	assign En_13=	(~select[7])&(~select[6])&(~select[5])&(select[4])&(~select[3])&(~select[2])&(select[1])&(select[0]);
	assign En_14=	(~select[7])&(~select[6])&(~select[5])&(select[4])&(~select[3])&(select[2])&(~select[1])&(~select[0]);
	assign En_15=	(~select[7])&(~select[6])&(~select[5])&(select[4])&(~select[3])&(select[2])&(~select[1])&(select[0]);
	assign En_21=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(~select[2])&(~select[1])&(select[0]);
	assign En_22=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(~select[2])&(select[1])&(~select[0]);
	assign En_23=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(select[2])&(~select[1])&(select[0]);
	assign En_24=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(select[2])&(~select[1])&(~select[0]);
	assign En_25=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(select[2])&(~select[1])&(select[0]);
	assign En_26=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(select[2])&(select[1])&(~select[0]);
	assign En_27=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(~select[3])&(select[2])&(select[1])&(select[0]);
	assign En_28=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(select[3])&(~select[2])&(~select[1])&(~select[0]);
	assign En_29=	(~select[7])&(~select[6])&(select[5])&(~select[4])&(select[3])&(~select[2])&(~select[1])&(select[0]);
	assign En_31=	(~select[7])&(~select[6])&(select[5])&(select[4])&(~select[3])&(~select[2])&(~select[1])&(select[0]);
	assign En_32=	(~select[7])&(~select[6])&(select[5])&(select[4])&(~select[3])&(~select[2])&(select[1])&(~select[0]);
	assign En_33=	(~select[7])&(~select[6])&(select[5])&(select[4])&(~select[3])&(~select[2])&(select[1])&(select[0]);
	assign En_34=	(~select[7])&(~select[6])&(select[5])&(select[4])&(~select[3])&(select[2])&(~select[1])&(~select[0]);
	assign En_35=	(~select[7])&(~select[6])&(select[5])&(select[4])&(~select[3])&(select[2])&(~select[1])&(select[0]);
	assign En_36=	(~select[7])&(~select[6])&(select[5])&(select[4])&(~select[3])&(select[2])&(select[1])&(~select[0]);
	assign En_41=	(~select[7])&(select[6])&(~select[5])&(~select[4])&(~select[3])&(~select[2])&(~select[1])&(select[0]);
	assign En_42=	(~select[7])&(select[6])&(~select[5])&(~select[4])&(~select[3])&(~select[2])&(select[1])&(~select[0]);
	assign En_43=	(~select[7])&(select[6])&(~select[5])&(~select[4])&(~select[3])&(~select[2])&(select[1])&(select[0]);
	assign En_44=	(~select[7])&(select[6])&(~select[5])&(~select[4])&(~select[3])&(select[2])&(~select[1])&(~select[0]);
	assign En_45=	(~select[7])&(select[6])&(~select[5])&(~select[4])&(~select[3])&(select[2])&(~select[1])&(select[0]);
	assign En_46=	(~select[7])&(select[6])&(~select[5])&(~select[4])&(~select[3])&(select[2])&(select[1])&(~select[0]);
	
endmodule 
module Mainn(
	
	input clk,
	input rst,
	
	//nuestras entradas son los switchs de la FPGA
	input sma,
	input rv1,
	input rv2,
	input rh1,
	input rh2,
	input tm,
	input ta,
	input fm,
	input fa,
	
	output  [1:0] s_out_theta_pos,
	output  [1:0] s_out_theta_neg,
	output  [1:0] s_out_phi_pos,
	output  [1:0] s_out_phi_neg
    );
	
	reg SMA;
	reg [15:0]R_vertical_1;
	reg [15:0]R_vertical_2;
	reg [15:0]R_horizontal_1;
	reg [15:0]R_horizontal_2;
	reg [15:0]theta_manual;
	reg [15:0]theta_actual;
	reg [15:0]phi_manual;
	reg[15:0]phi_actual;
	
	
always @ (*) begin
	
	if(sma)begin SMA=1'b1; end else begin SMA=1'b0; end
	
	if(rv1)begin R_vertical_1='d30; end else begin R_vertical_1='d5; end
	if(rv2)begin R_vertical_2='d40; end else begin R_vertical_1='d5; end
	if(rh1)begin R_horizontal_1='d35; end else begin R_horizontal_1='d5; end
	if(rh2)begin R_horizontal_2='d45; end else begin R_horizontal_2='d5; end

	if(tm)begin theta_manual='d35; end else begin theta_manual='d5; end
	if(ta)begin theta_actual='d45; end else begin theta_actual='d5; end
	if(fm)begin phi_manual='d30; end else begin phi_manual='d5; end
	if(fa)begin phi_actual='d40; end else begin phi_actual='d5; end
	

end

control_movimiento instance_name (
	 .rst(rst),
    .sma(sma), 
    .clk(clk), 
    .R_vertical_1(R_vertical_1), 
    .R_vertical_2(R_vertical_2), 
    .R_horizontal_1(R_horizontal_1), 
    .R_horizontal_2(R_horizontal_2), 
    .theta_manual(theta_manual), 
    .theta_actual(theta_actual), 
    .phi_manual(phi_manual), 
    .phi_actual(phi_actual), 
    .s_out_theta_pos(s_out_theta_pos), 
    .s_out_theta_neg(s_out_theta_neg), 
    .s_out_phi_pos(s_out_phi_pos), 
    .s_out_phi_neg(s_out_phi_neg)
    );
endmodule

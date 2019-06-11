`timescale 1ns / 1ps

/* Calculation */
module fadd_cal (op_sub,large_frac11,small_frac14,cal_frac);	
	input op_sub;
	input[10:0] large_frac11;
	input[13:0] small_frac14;
	output[14:0] cal_frac;

    //補上grs, 以及避免溢位狀況, 共15bit
	wire [14:0] aligned_large_frac = {1'b0, large_frac11, 3'b000};
	wire [14:0] aligned_small_frac = {1'b0, small_frac14};

    //相減或相加
	assign cal_frac = op_sub?
		aligned_large_frac - aligned_small_frac :
		aligned_large_frac + aligned_small_frac;

endmodule
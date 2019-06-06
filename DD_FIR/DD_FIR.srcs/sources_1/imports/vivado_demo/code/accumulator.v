module accumulator(
	input wire clk, 
	input wire [15:0] prod,	// a
    input wire acc_en,	
	output reg [15:0] acc	// s and b
);

	wire[15:0] tmp_acc;
	wire[15:0] tmp_out;

	wire prod_sign;
	wire [4:0] prod_exp;
	wire prod_op_sub;
	wire [13:0] prod_small_frac;
	wire [10:0] prod_large_frac;
	wire [14:0] c_frac;

	// Alignment
	fadd_align alignment(prod,tmp_acc,prod_sign,prod_exp,prod_op_sub,prod_large_frac,prod_small_frac);

	// Calculation
	fadd_cal calculation (prod_op_sub,prod_large_frac,prod_small_frac,c_frac);

	// Normalization
	fadd_norm normalization (prod_sign,prod_exp,c_frac,tmp_out);

	wire [4:0] out_exp,acc_exp;
	wire [9:0] out_frac,prod_frac,acc_frac;
	wire out_sign;

	reg tmp_out_sign;
	reg[4:0] tmp_out_exp;
	reg[9:0] tmp_out_frac;

	assign tmp_acc <= (acc_en)?acc:0;

	assign out_exp=tmp_out[14:10];
    assign out_frac=tmp_out[9:0];
	assign out_sign=tmp_out[15];

	assign acc[15]=tmp_out_sign;
	assign acc[14:10]=tmp_out_exp;
	assign acc[9:0]=tmp_out_frac;

	always @ (*) begin
		if((prod_exp==31 && prod_frac[9:0]!=0) || (acc_exp==31 && acc_frac[9:0]!=0)) begin
            tmp_out_sign <= 1;
            tmp_out_exp <= 31;
            tmp_out_frac[9] <= 1;
            tmp_out_frac[8:0] <= 0;
        end
		else if(out_exp==0 && out_frac==0) begin
			tmp_out_sign=0;
			tmp_out_exp <= out_exp;
            tmp_out_frac=out_frac;
		end
		else begin
			tmp_out_sign=out_sign;
			tmp_out_exp <= out_exp;
            tmp_out_frac=out_frac;
		end
	end

endmodule

	
    /*always @(posedge clk) begin
		acc <= {{4{prod[31]}},prod[31:0]} + ((acc_en)?acc:0);
	end


endmodule*/

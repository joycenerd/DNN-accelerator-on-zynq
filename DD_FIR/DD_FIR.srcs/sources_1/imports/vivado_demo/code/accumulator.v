module fpadder (a,b,s); // fp adder

	input[15:0] a, b;	// fp a and b
	output[15:0] s; 	// fp output
	wire[15:0] tmp_out;

    wire a_sign;
	wire [4:0] a_exp;
	wire a_op_sub;
	wire [13:0] a_small_frac;
	wire [10:0] a_large_frac;
    wire [14:0] c_frac;

    // Alignment
	fadd_align alignment(a,b,sub,a_sign,a_exp,a_op_sub,a_large_frac,a_small_frac);

	// Calculation
	fadd_cal calculation (a_op_sub,a_large_frac,a_small_frac,c_frac);

    // Normalization
	fadd_norm normalization (a_sign,a_exp,c_frac,tmp_out);

	wire [4:0] out_exp,b_exp;
	wire [9:0] out_frac,a_frac,b_frac;
	wire out_sign;
	
	reg tmp_out_sign;
	reg[4:0] tmp_out_exp;
	reg[9:0] tmp_out_frac;
	
    assign out_exp=tmp_out[14:10];
    assign out_frac=tmp_out[9:0];
	assign out_sign=tmp_out[15];

	assign s[15]=tmp_out_sign;
	assign s[14:10]=tmp_out_exp;
	assign s[9:0]=tmp_out_frac;

	always @ (*) begin
		if((a_exp==31 && a_frac[9:0]!=0) || (b_exp==31 && b_frac[9:0]!=0)) begin
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

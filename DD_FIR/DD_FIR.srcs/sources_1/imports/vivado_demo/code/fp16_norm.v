/* Normalization */
module fadd_norm (sign,temp_exp,cal_frac,s);
	input sign;		// result sign
	input[4:0] temp_exp;	// temp exponent
	input[14:0] cal_frac;	// fraction before normalization
	output[15:0] s;		// result

    wire [13:0] f3, f2, f1, f0;

    // 從左邊找到第一個1
	wire [3:0] zeros;	// 左邊數起有幾個0
	assign zeros[3] = ~|cal_frac[13:6];	// 8-bit 0
	assign f3 = zeros[3]? {cal_frac[5:0],8'b0} : cal_frac[13:0];
	assign zeros[2] = ~|f3[13:10];			// 4-bit 0
	assign f2 = zeros[2]? {f3[9:0], 4'b0} : f3;
	assign zeros[1] = ~|f2[13:12];			// 2-bit 0
	assign f1 = zeros[1]? {f2[11:0], 2'b0} : f2;
	assign zeros[0] = ~|f1[13];			// 1-bit 0
	assign f0 = zeros[0]? {f1[12:0], 1'b0} : f1;
	reg [13:0] frac0;
	reg [5:0] exp0;

    // 位移以及修改exponent
	always @ * begin

		if (cal_frac==0) begin	// Result is 0
			frac0 = 0;
			exp0 = 0;
		end

		else if (cal_frac[14]) begin
			frac0 = cal_frac[14:1];	// 1x.xxxxxxxxxxxxxxxxxxxxxxx xx
			exp0 = temp_exp + 5'h1; // ->1.xxxxxxxxxxxxxxxxxxxxxxx xxx
		end

		else begin
			exp0 = temp_exp - zeros;
			frac0 = f0; // 01.xxxxxxxxxxxxxxxxxxxxxxx xxx
			
		end

	end

    // Rounding
	wire frac_plus_1 =
	frac0[2] & (frac0[1] | frac0[0]) |
	frac0[2] & ~frac0[1] & ~frac0[0] & frac0[3];

	wire[11:0] frac_round = {1'b0, frac0[13:3]} + frac_plus_1;
	wire[4:0] exponent = frac_round[11] ?
							exp0 + 5'h1 :
							exp0;

    assign s = {sign, exponent, frac_round[9:0]};

endmodule
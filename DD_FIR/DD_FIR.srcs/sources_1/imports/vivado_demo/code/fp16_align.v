/* Alignment */
module fadd_align (a,b,sub,sign,temp_exp,op_sub,large_frac11,small_frac14);	
	input[15:0] a, b;	// fp a and b
    input sub;
	output sign;			// result sign
	output[4:0] temp_exp;	// result exponent
	output op_sub;			// fraction operation
	output[10:0] large_frac11;		// fraction of large one
	output[13:0] small_frac14;	// fraction of small one

    // 不看sign bit,判斷a or b大
	wire exchange = (b[14:0] > a[14:0]);
	wire [15:0] fp_large = exchange? b : a;
	wire [15:0] fp_small = exchange? a : b;

    // 轉成1.f格式
	wire fp_large_hidden_bit = |fp_large[14:10];
	wire fp_small_hidden_bit = |fp_small[14:10];
	wire [10:0] large_frac11 = {fp_large_hidden_bit, fp_large[9:0]};
	wire [10:0] small_frac11 = {fp_small_hidden_bit, fp_small[9:0]};

    // 儲存較大數的exponent
	assign temp_exp = fp_large[14:10];

    // fraction運算使用加法或減法
	assign op_sub = sub ^ fp_large[15] ^ fp_small[15];

    // ea-eb
	wire[4:0] exp_diff = fp_large[14:10] - fp_small[14:10];

    // 計算需要位移幾位, 並且位移
	wire[23:0] small_frac25 = (exp_diff >= 13) ? 
								{13'h0, small_frac11} : 
								{small_frac11, 13'h0} >> exp_diff;

    // 留下11bit以及保護.循環位, 計算多出來的位數, 使用reduction OR簡化成1bit
	assign small_frac14 = {small_frac25[23:11], |small_frac25[10:0]};
endmodule


module multi(in_a,in_b,out);

    input[15:0] in_a,in_b;
    output[15:0] out;

    wire a_sign,b_sign;
    wire[4:0] a_exp,b_exp;
    wire[10:0] a_mantissa,b_mantissa;


    reg out_sign;
    reg[4:0] out_exp;
    reg[10:0] out_mantissa;

    reg[15:0] multiplyin_a,multiplyin_b;
    wire[15:0] multiply_out;

    assign a_sign=in_a[15];
    assign a_exp[4:0]=in_a[14:10];
    assign a_mantissa[10:0]={1'b1,in_a[9:0]};

    assign b_sign=in_b[15];
    assign b_exp[4:0]=in_b[14:10];
    assign b_mantissa[10:0]={1'b1,in_b[9:0]};

    assign  out[15] = out_sign;
	assign  out[14:10] = out_exp;				
	assign  out[9:0] = out_mantissa[9:0];

    multiplier16 mpy(multiplyin_a,multiplyin_b,multiply_out);

    always @ (*)
    begin
        // NaN * b = NaN, a * NaN =NaN
        // NaN= exp=255 and fraction!=0
        if((a_exp==31 && a_mantissa[9:0]!=0) || (b_exp==31 && b_mantissa[9:0]!=0)) begin
            out_sign <= 1;
            out_exp <= 31;
            out_mantissa[9] <= 1;
            out_mantissa[8:0] <= 0;
        end

        // Inf=exp=255 and fraction=0
        // Inf * 0 = NaN
        else if(a_exp==31) begin
            if(b_exp==0 && b_mantissa[9:0]==0) begin
                out_sign <= 1;
                out_exp <= 31;
                out_mantissa[9] <=1;
                out_mantissa[8:0] <= 0;
            end
            // Inf * b = Inf
            else begin
                out_sign <= a_sign ^ b_sign;
                out_exp <= 31;
                out_mantissa <= 0;
            end
        end

        // 0 * Inf = NaN
        else if(b_exp==31) begin
            if(a_exp==0 && a_mantissa[9:0]==0) begin
                out_sign <= 1;
                out_exp <= 31;
                out_mantissa[9] <=1;
                out_mantissa[8:0] <= 0;
            end
            // a * Inf = Nan
            else begin
                out_sign <= a_sign ^ b_sign;
                out_exp <= 31;
                out_mantissa <= 0;
            end
        end

        // a * 0 = 0
        else if(b_exp==0 && b_mantissa[9:0]==0) begin
            out_sign <= 0;
            out_exp <= 0;
            out_mantissa <= 0;
        end

        // 0 * b = 0
        else if(a_exp==0 && a_mantissa[9:0]==0) begin
            out_sign <= 0;
            out_exp <= 0;
            out_mantissa <= 0;
        end

        else begin
            multiplyin_a <= in_a;
            multiplyin_b <= in_b;
            //multiplier16 mpy(multiplyin_a[15:0],multiplyin_b[15:0],multiply_out[15:0]);
            out_sign=multiply_out[15];
            out_exp=multiply_out[14:10];
            out_mantissa=multiply_out[9:0];
        end		

    end

	/*always @(posedge clk) begin
		prod <= coef * di; 
	end*/
	
endmodule

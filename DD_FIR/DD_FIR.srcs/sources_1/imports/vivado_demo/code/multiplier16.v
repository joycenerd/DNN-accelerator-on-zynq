module multiplier16(in_a,in_b,out);
    input[15:0] in_a,in_b;
    output[15:0] out;

    reg a_sign,b_sign,out_sign;
    reg[4:0] a_exp,b_exp,out_exp;
    reg[10:0] a_mantissa,b_mantissa;
    reg[9:0] out_mantissa;
    reg[21:0] product;

    assign out[15] = out_sign;
	assign out[14:10] = out_exp;
	assign out[9:0] = out_mantissa[9:0];

    always @(*) begin
        a_sign=in_a[15];
        a_exp=in_a[14:10];
        a_mantissa={1'b1,in_a[9:0]};

        b_sign=in_b[15];
        b_exp=in_b[14:10];
        b_mantissa={1'b1,in_b[9:0]};

        // multiplication
        out_sign = a_sign ^ b_sign;
        out_exp = a_exp + b_exp - 15;
        product = a_mantissa * b_mantissa;

    
        // normalization
        if(product[21]==1) begin
            out_exp=out_exp+1;
            product = product >> 1;
        end

        // rounding
        out_mantissa=product[20:10];
        if(product[9]==1) begin
            out_mantissa=out_mantissa+1;
        end
    end
    
endmodule

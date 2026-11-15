// Unsigned Divider
module origen_130143 #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] div,
    input [WIDTH-1:0] dvsr,
    output reg [WIDTH-1:0] q,
    output reg [WIDTH-1:0] r
);

reg [WIDTH-1:0] dividend, divisor;
reg [WIDTH:0] diff;
integer i;

always @(*) begin
    if (dvsr == 0) begin
        q = 0;
        r = 0;
    end else if (div < dvsr) begin
        q = 0;
        r = div;
    end else begin
        dividend = div;
        divisor = dvsr;
        q = 0;
        r = 0;
        
        for (i = 0; i < WIDTH; i = i + 1) begin
            diff = {r, dividend[WIDTH-1]};
            if (diff >= divisor) begin
                r = diff - divisor;
                q = (q << 1) | 1'b1;
            end else begin
                r = diff;
                q = q << 1;
            end
            dividend = dividend << 1;
        end
    end
end

endmodule

// Signed Divider
module signed_divider #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] div,
    input [WIDTH-1:0] dvsr,
    input sign,
    output reg [WIDTH-1:0] q,
    output reg [WIDTH-1:0] r
);

reg [WIDTH-1:0] dividend, divisor;
reg [WIDTH:0] diff;
reg div_sign, dvsr_sign;
integer i;

always @(*) begin
    if (dvsr == 0) begin
        q = 0;
        r = 0;
    end else begin
        div_sign = div[WIDTH-1];
        dvsr_sign = dvsr[WIDTH-1];
        
        dividend = div_sign ? -div : div;
        divisor = dvsr_sign ? -dvsr : dvsr;
        
        if (dividend < divisor) begin
            q = 0;
            r = div_sign ? -dividend : dividend;
        end else begin
            q = 0;
            r = 0;
            
            for (i = 0; i < WIDTH; i = i + 1) begin
                diff = {r, dividend[WIDTH-1]};
                if (diff >= divisor) begin
                    r = diff - divisor;
                    q = (q << 1) | 1'b1;
                end else begin
                    r = diff;
                    q = q << 1;
                end
                dividend = dividend << 1;
            end
            
            if (sign) begin
                q = -q;
                r = -r;
            end else if (div_sign ^ dvsr_sign) begin
                q = -q;
            end
            
            if (div_sign) r = -r;
        end
    end
end

endmodule
module origen_042137(q, q1, j, k, c);
    output reg q, q1;
    input j, k, c;
    
    initial begin
        q = 1'b0;
        q1 = 1'b1;
    end
    
    always @(posedge c) begin
        case ({j, k})
            2'b00: begin q <= q; q1 <= q1; end
            2'b01: begin q <= 1'b0; q1 <= 1'b1; end
            2'b10: begin q <= 1'b1; q1 <= 1'b0; end
            2'b11: begin q <= ~q; q1 <= ~q1; end
        endcase
    end
endmodule

module contAssincDecresc(s, pulse, um);
    output [4:0] s;
    input pulse, um;
    wire [4:0] q1;
    
    jkff ff0(s[0], q1[0], um, um, pulse);
    jkff ff1(s[1], q1[1], um, um, q1[0]);
    jkff ff2(s[2], q1[2], um, um, q1[1]);
    jkff ff3(s[3], q1[3], um, um, q1[2]);
    jkff ff4(s[4], q1[4], um, um, q1[3]);
endmodule


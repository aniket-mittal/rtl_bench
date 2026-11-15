module origen_147476(
    input wire clk,
    input wire d_in,
    input wire [31:0] byte_in,
    output wire led_out
);

    wire d_out;
    wire [31:0] reversed_byte;
    
    d_flip_flop dff (
        .clk(clk),
        .d(d_in),
        .q(d_out)
    );
    
    byte_reversal br (
        .byte_in(byte_in),
        .byte_out(reversed_byte)
    );
    
    xor_module xm (
        .d_in(d_out),
        .byte_in(reversed_byte),
        .led_out(led_out)
    );

endmodule

module d_flip_flop(
    input wire clk,
    input wire d,
    output reg q
);
    wire j, k;
    
    assign j = d;
    assign k = ~d;
    
    always @(negedge clk) begin
        q <= (j & ~q) | (~k & q);
    end
endmodule

module byte_reversal(
    input wire [31:0] byte_in,
    output wire [31:0] byte_out
);
    assign byte_out = {byte_in[7:0], byte_in[15:8], byte_in[23:16], byte_in[31:24]};
endmodule

module xor_module(
    input wire d_in,
    input wire [31:0] byte_in,
    output wire led_out
);
    assign led_out = d_in ^ (^byte_in);
endmodule
module origen_137703(
    input wire clk,
    input wire reset_sync,
    input wire reset_async,
    input wire a,
    input wire b,
    output wire [15:0] bcd_out,
    output wire final_out
);

    wire sum, carry;
    wire [3:0] johnson_out;
    wire [3:0] enable;

    // Half Adder using NAND gates
    wire nand1, nand2, nand3, nand4;

    nand(nand1, a, b);
    nand(nand2, a, nand1);
    nand(nand3, b, nand1);
    nand(sum, nand2, nand3);
    nand(carry, nand1, nand1);

    // BCD Counter
    bcd_counter bcd_counter_inst(
        .clk(clk),
        .reset_sync(reset_sync),
        .reset_async(reset_async),
        .bcd_out(bcd_out),
        .enable(enable)
    );

    // Johnson Counter
    johnson_counter johnson_counter_inst(
        .clk(clk),
        .reset(reset_sync | reset_async),
        .out(johnson_out)
    );

    // Decoder
    decoder decoder_inst(
        .in(johnson_out),
        .out(enable)
    );

    // Additional functional module
    functional_module func_mod(
        .sum(sum),
        .bcd_out(bcd_out),
        .final_out(final_out)
    );

endmodule

module bcd_counter(
    input wire clk,
    input wire reset_sync,
    input wire reset_async,
    output reg [15:0] bcd_out,
    input wire [3:0] enable
);

    always @(posedge clk or posedge reset_async) begin
        if (reset_async)
            bcd_out <= 16'b0;
        else if (reset_sync)
            bcd_out <= 16'b0;
        else begin
            if (enable[0])
                bcd_out[3:0] <= (bcd_out[3:0] == 4'd9) ? 4'd0 : bcd_out[3:0] + 1'd1;
            if (enable[1])
                bcd_out[7:4] <= (bcd_out[7:4] == 4'd9) ? 4'd0 : bcd_out[7:4] + 1'd1;
            if (enable[2])
                bcd_out[11:8] <= (bcd_out[11:8] == 4'd9) ? 4'd0 : bcd_out[11:8] + 1'd1;
            if (enable[3])
                bcd_out[15:12] <= (bcd_out[15:12] == 4'd9) ? 4'd0 : bcd_out[15:12] + 1'd1;
        end
    end

endmodule

module johnson_counter(
    input wire clk,
    input wire reset,
    output reg [3:0] out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 4'b0001;
        else
            out <= {out[2:0], ~out[3]};
    end

endmodule

module decoder(
    input wire [3:0] in,
    output reg [3:0] out
);

    always @(*) begin
        case(in)
            4'b0001: out = 4'b0001;
            4'b0011: out = 4'b0010;
            4'b0111: out = 4'b0100;
            4'b1111: out = 4'b1000;
            default: out = 4'b0000;
        endcase
    end

endmodule

module functional_module(
    input wire sum,
    input wire [15:0] bcd_out,
    output reg final_out
);

    always @(*) begin
        final_out = sum ^ (|bcd_out);
    end

endmodule
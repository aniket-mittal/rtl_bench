module origen_134628 (
    input wire clk,
    input wire rst,
    input wire [255:0] mux_in,
    input wire [7:0] mux_sel,
    input wire counter_dir,
    output wire system_out
);

    wire mux_out;
    wire [2:0] counter_out;

    // 256-to-1 multiplexer
    mux_256to1 mux (
        .in(mux_in),
        .sel(mux_sel),
        .out(mux_out)
    );

    // Bidirectional 3-bit counter
    counter_3bit counter (
        .clk(clk),
        .rst(rst),
        .dir(counter_dir),
        .count(counter_out)
    );

    // Bitwise AND of multiplexer and counter outputs
    assign system_out = mux_out & counter_out[0];

endmodule

module mux_256to1 (
    input wire [255:0] in,
    input wire [7:0] sel,
    output wire out
);

    assign out = in[sel];

endmodule

module counter_3bit (
    input wire clk,
    input wire rst,
    input wire dir,
    output reg [2:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 3'b000;
        else if (dir)
            count <= (count == 3'b111) ? 3'b000 : count + 1;
        else
            count <= (count == 3'b000) ? 3'b111 : count - 1;
    end

endmodule
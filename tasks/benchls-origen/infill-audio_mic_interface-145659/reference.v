module origen_145659 (
    input wire clk,
    input wire rst,
    input wire [15:0] d_in,
    input wire cs,
    input wire wr,
    input wire rd,
    input wire [3:0] addr,
    output reg [15:0] d_out,
    output reg ledres,
    output reg mclk,
    output reg micLRSel,
    input wire micData
);

    // Internal registers
    reg [15:0] control_reg;
    reg [15:0] status_reg;
    reg [15:0] data_reg;
    reg [15:0] config_reg;

    // Internal wires
    wire [15:0] mux_out;
    wire [3:0] demux_sel;

    // MUX 4-to-1
    mux_4 mux (
        .in0(control_reg),
        .in1(status_reg),
        .in2(data_reg),
        .in3(config_reg),
        .sel(addr[1:0]),
        .out(mux_out)
    );

    // DEMUX 1-to-4
    demux_4 demux (
        .in(d_in),
        .sel(addr[1:0]),
        .out0(demux_sel[0]),
        .out1(demux_sel[1]),
        .out2(demux_sel[2]),
        .out3(demux_sel[3])
    );

    // Clock divider for mclk
    reg [7:0] clk_div;
    always @(posedge clk or posedge rst) begin
        if (rst)
            clk_div <= 8'd0;
        else
            clk_div <= clk_div + 1'b1;
    end

    // Main logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            control_reg <= 16'd0;
            status_reg <= 16'd0;
            data_reg <= 16'd0;
            config_reg <= 16'd0;
            d_out <= 16'd0;
            ledres <= 1'b0;
            mclk <= 1'b0;
            micLRSel <= 1'b0;
        end else begin
            // Write operation
            if (cs && wr) begin
                case (addr)
                    4'b0000: control_reg <= d_in;
                    4'b0001: status_reg <= d_in;
                    4'b0010: data_reg <= d_in;
                    4'b0011: config_reg <= d_in;
                    default: ;
                endcase
            end

            // Read operation
            if (cs && rd) begin
                d_out <= mux_out;
            end

            // Update outputs based on control register
            ledres <= control_reg[0];
            micLRSel <= control_reg[1];

            // Generate mclk
            mclk <= clk_div[7];

            // Update status register with micData
            status_reg[0] <= micData;
        end
    end

endmodule

// 4-to-1 Multiplexer
module mux_4 (
    input wire [15:0] in0,
    input wire [15:0] in1,
    input wire [15:0] in2,
    input wire [15:0] in3,
    input wire [1:0] sel,
    output reg [15:0] out
);
    always @(*) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
        endcase
    end
endmodule

// 1-to-4 Demultiplexer
module demux_4 (
    input wire [15:0] in,
    input wire [1:0] sel,
    output reg [15:0] out0,
    output reg [15:0] out1,
    output reg [15:0] out2,
    output reg [15:0] out3
);
    always @(*) begin
        out0 = 16'd0;
        out1 = 16'd0;
        out2 = 16'd0;
        out3 = 16'd0;
        case (sel)
            2'b00: out0 = in;
            2'b01: out1 = in;
            2'b10: out2 = in;
            2'b11: out3 = in;
        endcase
    end
endmodule
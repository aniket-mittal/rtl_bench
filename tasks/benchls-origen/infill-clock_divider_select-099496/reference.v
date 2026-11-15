module origen_099496 (
    input wire CLK_in,
    input wire reset,
    input wire [2:0] CLK_sel,
    output wire CLK_out
);

    reg [15:0] count_max;

    always @(*) begin
        case (CLK_sel)
            3'b000: count_max = 16'd23900;
            3'b001: count_max = 16'd26795;
            3'b010: count_max = 16'd30075;
            3'b011: count_max = 16'd33784;
            3'b100: count_max = 16'd37922;
            3'b101: count_max = 16'd42577;
            3'b110: count_max = 16'd47801;
            3'b111: count_max = 16'd53687;
        endcase
    end

    counter #(.N(16)) counter_inst (
        .CLK_in(CLK_in),
        .reset(reset),
        .count_max(count_max),
        .CLK_out(CLK_out)
    );

endmodule

module counter #(
    parameter N = 16
) (
    input wire CLK_in,
    input wire reset,
    input wire [N-1:0] count_max,
    output reg CLK_out
);

    reg [N-1:0] count;

    always @(posedge CLK_in or posedge reset) begin
        if (reset) begin
            count <= 0;
            CLK_out <= 0;
        end else begin
            if (count == count_max) begin
                count <= 0;
                CLK_out <= ~CLK_out;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
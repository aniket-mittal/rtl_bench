module origen_096702 #(
    parameter INPUT_BITS_NUM = 16,
    parameter NUM_DELAY_CYCLE = 4
) (
    input wire clock,
    input wire reset,
    input wire [INPUT_BITS_NUM-1:0] data_in,
    output wire [INPUT_BITS_NUM-1:0] data_out
);

    wire [INPUT_BITS_NUM-1:0] internal_wire [NUM_DELAY_CYCLE-1:0];

    genvar i;
    generate
        for (i = 0; i < NUM_DELAY_CYCLE; i = i + 1) begin : delay_stage
            if (i == 0) begin
                dff #(.WIDTH(INPUT_BITS_NUM)) dff_inst (
                    .clock(clock),
                    .reset(reset),
                    .d(data_in),
                    .q(internal_wire[i])
                );
            end else begin
                dff #(.WIDTH(INPUT_BITS_NUM)) dff_inst (
                    .clock(clock),
                    .reset(reset),
                    .d(internal_wire[i-1]),
                    .q(internal_wire[i])
                );
            end
        end
    endgenerate

    assign data_out = internal_wire[NUM_DELAY_CYCLE-1];

endmodule

module dff #(
    parameter WIDTH = 1
) (
    input wire clock,
    input wire reset,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            q <= {WIDTH{1'b0}};
        end else begin
            q <= d;
        end
    end

endmodule
module origen_053283 #(
    parameter dataWidth = 16
) (
    input wire clk,
    input wire reset,
    input wire cen,
    input wire signed [dataWidth-1:0] data_in,
    output wire done,
    output reg signed [dataWidth-1:0] data_out_2
);

    reg signed [dataWidth-1:0] data_out, data_out_1;
    reg cen_1, cen_2, cen_3;

    wire signed [dataWidth-1:0] one_pos, one_neg;
    assign one_pos = {1'b0, {(dataWidth-1){1'b1}}};  // 1 in fixed-point
    assign one_neg = {1'b1, {(dataWidth-1){1'b0}}};  // -1 in fixed-point

    // Stage 1: Hard Tanh Computation
    always @(*) begin
        if (cen) begin
            if (data_in < one_neg)
                data_out = one_neg;
            else if (data_in > one_pos)
                data_out = one_pos;
            else
                data_out = data_in;
        end else begin
            data_out = {dataWidth{1'bz}};
        end
    end

    // Pipeline stages and clock enable propagation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out_1 <= 0;
            data_out_2 <= 0;
            cen_1 <= 0;
            cen_2 <= 0;
            cen_3 <= 0;
        end else begin
            // Stage 2
            data_out_1 <= data_out;
            cen_1 <= cen;

            // Stage 3
            data_out_2 <= data_out_1;
            cen_2 <= cen_1;

            // Final stage for done signal
            cen_3 <= cen_2;
        end
    end

    // Done signal
    assign done = cen_3;

endmodule
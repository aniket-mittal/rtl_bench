module origen_132576 (
    input wire clk,
    input wire rstn,
    input wire signed [31:0] dx_fx,
    input wire signed [31:0] dy_fx,
    input wire [95:0] cmp_i,
    output reg [7:0] curr_i
);

    reg signed [57:0] ix, iy, ixy;
    reg signed [19:0] curr;
    wire [17:0] sp_fx;
    wire [25:0] idx_fx, idy_fx;

    assign sp_fx = flt_fx_8p10(cmp_i[31:0]);
    assign idx_fx = flt_fx_16p10(cmp_i[63:32]);
    assign idy_fx = flt_fx_16p10(cmp_i[95:64]);

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            ix <= 58'b0;
            iy <= 58'b0;
            ixy <= 58'b0;
            curr <= 20'b0;
        end else begin
            ix <= dx_fx * idx_fx;
            iy <= dy_fx * idy_fx;
            ixy <= ix + iy;
            curr <= ixy[57:38] + {10'b0, sp_fx[17:8]};
        end
    end

    always @(*) begin
        if (curr[19] == 1'b1)
            curr_i = 8'h00;
        else if (curr[18] == 1'b1)
            curr_i = 8'hff;
        else
            curr_i = curr[7:0];
    end

    function [17:0] flt_fx_8p10;
        input [31:0] float_in;
        // Implementation of float to 8.10 fixed-point conversion
        // This is a placeholder and should be replaced with actual conversion logic
        flt_fx_8p10 = float_in[17:0];
    endfunction

    function [25:0] flt_fx_16p10;
        input [31:0] float_in;
        // Implementation of float to 16.10 fixed-point conversion
        // This is a placeholder and should be replaced with actual conversion logic
        flt_fx_16p10 = float_in[25:0];
    endfunction

endmodule
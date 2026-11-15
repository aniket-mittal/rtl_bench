module origen_202344(
    input clk,
    input rst,
    input enable,
    input [31:0] A,
    input [31:0] B,
    output [31:0] result,
    output valid
);

reg [31:0] result_reg;
reg valid_reg;

wire [7:0] exp_A, exp_B;
wire [22:0] mant_A, mant_B;
wire sign_A, sign_B;

wire [8:0] expR;
reg [47:0] Mult;
reg [4:0] shift_amt;
wire sign_R;

assign exp_A = A[30:23];
assign exp_B = B[30:23];
assign mant_A = {1'b1, A[22:0]};
assign mant_B = {1'b1, B[22:0]};
assign sign_A = A[31];
assign sign_B = B[31];

assign expR = exp_A + exp_B - 8'd127;
assign sign_R = sign_A ^ sign_B;

always @(posedge clk) begin
    if (rst) begin
        result_reg <= 32'b0;
        valid_reg <= 1'b0;
        Mult <= 48'b0;
        shift_amt <= 5'b0;
    end else if (enable) begin
        if (A == 32'b0 || B == 32'b0) begin
            result_reg <= 32'b0;
        end else if (A == 32'hFFFFFFFF || B == 32'hFFFFFFFF) begin
            result_reg <= 32'hFFFFFFFF;
        end else begin
            Mult <= mant_A * mant_B;
            shift_amt <= Mult[47] ? 5'd0 : (Mult[46] ? 5'd1 : (Mult[45] ? 5'd2 : (Mult[44] ? 5'd3 : (Mult[43] ? 5'd4 : (Mult[42] ? 5'd5 : (Mult[41] ? 5'd6 : (Mult[40] ? 5'd7 : (Mult[39] ? 5'd8 : (Mult[38] ? 5'd9 : 5'd10)))))))));
            result_reg <= {sign_R, expR[7:0], Mult[47:24] >> shift_amt};
        end
        valid_reg <= 1'b1;
    end else begin
        valid_reg <= 1'b0;
    end
end

assign result = result_reg;
assign valid = valid_reg;

endmodule
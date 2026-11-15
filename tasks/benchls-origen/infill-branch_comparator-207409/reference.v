module origen_207409 (
    input [31:0] rs1_out,
    input [31:0] rs2_out,
    input BrUn,
    output reg BrEq,
    output reg BrLT
);

always @(*) begin
    if (BrUn) begin
        // Unsigned comparison
        if (rs1_out[31] != rs2_out[31]) begin
            // Different signs
            BrEq = 0;
            BrLT = rs1_out[31];
        end else begin
            // Same signs
            if (rs1_out == rs2_out) begin
                BrEq = 1;
                BrLT = 0;
            end else if (rs1_out < rs2_out) begin
                BrEq = 0;
                BrLT = 1;
            end else begin
                BrEq = 0;
                BrLT = 0;
            end
        end
    end else begin
        // Signed comparison
        if (rs1_out[31] != rs2_out[31]) begin
            // Different signs
            BrEq = 0;
            BrLT = rs1_out[31];
        end else begin
            // Same signs
            if (rs1_out == rs2_out) begin
                BrEq = 1;
                BrLT = 0;
            end else if ($signed(rs1_out) < $signed(rs2_out)) begin
                BrEq = 0;
                BrLT = 1;
            end else begin
                BrEq = 0;
                BrLT = 0;
            end
        end
    end
end

endmodule
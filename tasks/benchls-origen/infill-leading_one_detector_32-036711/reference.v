module origen_036711(
    input [31:0] S,
    output reg [4:0] R
);

always @(*) begin
    if (S[31:16] != 16'b0) begin
        R[4] = 1'b1;
        if (S[31:24] != 8'b0) begin
            R[3] = 1'b1;
            if (S[31:28] != 4'b0) begin
                R[2] = 1'b1;
                if (S[31:30] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[31];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[29];
                end
            end else begin
                R[2] = 1'b0;
                if (S[27:26] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[27];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[25];
                end
            end
        end else begin
            R[3] = 1'b0;
            if (S[23:20] != 4'b0) begin
                R[2] = 1'b1;
                if (S[23:22] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[23];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[21];
                end
            end else begin
                R[2] = 1'b0;
                if (S[19:18] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[19];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[17];
                end
            end
        end
    end else begin
        R[4] = 1'b0;
        if (S[15:8] != 8'b0) begin
            R[3] = 1'b1;
            if (S[15:12] != 4'b0) begin
                R[2] = 1'b1;
                if (S[15:14] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[15];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[13];
                end
            end else begin
                R[2] = 1'b0;
                if (S[11:10] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[11];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[9];
                end
            end
        end else begin
            R[3] = 1'b0;
            if (S[7:4] != 4'b0) begin
                R[2] = 1'b1;
                if (S[7:6] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[7];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[5];
                end
            end else begin
                R[2] = 1'b0;
                if (S[3:2] != 2'b0) begin
                    R[1] = 1'b1;
                    R[0] = S[3];
                end else begin
                    R[1] = 1'b0;
                    R[0] = S[1];
                end
            end
        end
    end
end

endmodule
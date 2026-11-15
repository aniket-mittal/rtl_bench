module origen_176396(
    input clk,
    input rst,
    input [4:0] EXRs,
    input [4:0] EXRt,
    input [4:0] MEMRd,
    input [4:0] WBRd,
    input EXControl,
    input MEMControl,
    input WBRegWrite,
    output reg [1:0] Fwd1,
    output reg [1:0] Fwd2
);

    always @(*) begin
        if (!EXControl) begin
            Fwd1 = 2'b00;
            Fwd2 = 2'b00;
        end
        else begin
            // Fwd1
            if (MEMRd == EXRs && MEMControl) begin
                Fwd1 = 2'b10;
            end
            else if (WBRd == EXRs && WBRegWrite) begin
                Fwd1 = 2'b01;
            end
            else begin
                Fwd1 = 2'b00;
            end

            // Fwd2
            if (MEMRd == EXRt && MEMControl) begin
                Fwd2 = 2'b10;
            end
            else if (WBRd == EXRt && WBRegWrite) begin
                Fwd2 = 2'b01;
            end
            else begin
                Fwd2 = 2'b00;
            end
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Fwd1 <= 2'b00;
            Fwd2 <= 2'b00;
        end
    end

endmodule
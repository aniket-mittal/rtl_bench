module origen_058725 (
    input wire clk,
    input wire rst,
    input wire signed [31:0] LineLocation,
    output reg signed [31:0] ConMsg
);

    parameter P = 1;
    parameter I = 1;
    parameter D = 1;
    parameter M = 100;
    parameter MIDLINE = 640;

    reg signed [31:0] error, DifError, SumError, LastError;
    reg Mclk;
    reg [31:0] count;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 0;
            Mclk <= 0;
        end else begin
            if (count == M-1) begin
                count <= 0;
                Mclk <= ~Mclk;
            end else begin
                count <= count + 1;
            end
        end
    end

    always @(posedge Mclk or negedge rst) begin
        if (!rst) begin
            error <= 0;
            DifError <= 0;
            SumError <= 0;
            LastError <= 0;
            ConMsg <= 0;
        end else begin
            if (LineLocation < 30) begin
                error <= -640;
            end else if (LineLocation > 1250) begin
                error <= 640;
            end else begin
                error <= MIDLINE - LineLocation;
            end

            DifError <= LastError - error;
            SumError <= SumError + error;
            LastError <= error;

            ConMsg <= P * error + I * SumError + D * DifError;
        end
    end

endmodule
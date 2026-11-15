module origen_178612(
    input GO,
    input GT,
    input [3:0] N,
    input clk,
    input rst,
    output reg LOADCNT,
    output reg ENCNT,
    output reg MUXPROD,
    output reg LOADPROD,
    output reg MUXOUT,
    output reg DONE,
    output reg ERROR
);

    parameter S00 = 3'b000, S01 = 3'b001, S10 = 3'b010, S11 = 3'b011, S20 = 3'b100;
    reg [2:0] CS, NS;
    reg [4:0] ctrl;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            CS <= S00;
            ctrl <= 5'b00000;
            ERROR <= 1'b0;
        end
        else begin
            CS <= NS;
            ctrl <= {LOADCNT, ENCNT, MUXPROD, LOADPROD, MUXOUT};

            if (N > 4'b1100)
                ERROR <= 1'b1;
            else
                ERROR <= 1'b0;
        end
    end

    always @(*) begin
        case (CS)
            S00: begin
                if (GO) begin
                    NS = S01;
                    ctrl = 5'b10000;
                end
                else begin
                    NS = S00;
                    ctrl = 5'b00000;
                end
            end
            S01: begin
                if (GT) begin
                    NS = S10;
                    ctrl = 5'b01000;
                end
                else begin
                    NS = S01;
                    ctrl = 5'b10000;
                end
            end
            S10: begin
                if (ERROR) begin
                    NS = S00;
                    ctrl = 5'b00000;
                end
                else begin
                    NS = S11;
                    ctrl = 5'b00100;
                end
            end
            S11: begin
                if (GT) begin
                    NS = S20;
                    ctrl = 5'b00010;
                end
                else begin
                    NS = S11;
                    ctrl = 5'b00100;
                end
            end
            S20: begin
                NS = S00;
                ctrl = 5'b00001;
                DONE = 1'b1;
            end
            default: begin
                NS = S00;
                ctrl = 5'b00000;
            end
        endcase

        {LOADCNT, ENCNT, MUXPROD, LOADPROD, MUXOUT} = ctrl;
    end

endmodule
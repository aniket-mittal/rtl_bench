module origen_213045(
    input wire clk,
    input wire nRST,
    input wire HO,
    input wire IM1,
    input wire IM0,
    output reg [15:0] oData,
    output reg oVal,
    output reg TEST
);

    reg [2:0] cntHO;
    reg [1:0] state;

    localparam HOHOLD = 2'b00;
    localparam WAITIM = 2'b01;
    localparam WAITHO = 2'b10;

    always @(posedge clk or negedge nRST) begin
        if (~nRST) begin
            oData <= 16'b0;
            oVal <= 1'b0;
            TEST <= 1'b0;
            cntHO <= 3'b0;
            state <= WAITHO;
        end
        else begin
            case (state)
                HOHOLD: begin
                    if (HO) begin
                        cntHO <= cntHO + 1'b1;
                        if (cntHO == 3'd5) begin
                            TEST <= 1'b1;
                            state <= WAITIM;
                        end
                    end
                end
                WAITIM: begin
                    cntHO <= 3'b0;
                    TEST <= 1'b0;
                    state <= WAITHO;
                end
                WAITHO: begin
                    if (~HO) begin
                        state <= HOHOLD;
                    end
                end
                default: state <= WAITHO;
            endcase
        end
    end

endmodule
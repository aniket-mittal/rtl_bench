module origen_198191(
    input clk,
    input reset,
    input [2:0] opCodeIn,
    output reg ld_number,
    output reg clr_number,
    output reg ld_opcode,
    output reg ld_result,
    output reg clr_result,
    output reg sel_muxAlu,
    output reg sel_muxDisplay,
    output reg clr_opCode,
    output reg [2:0] opCodeOut,
    output reg E0,
    output reg E1,
    output reg E2,
    output reg E3
);

    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= S0;
            ld_number <= 1'b0;
            clr_number <= 1'b0;
            ld_opcode <= 1'b0;
            ld_result <= 1'b0;
            clr_result <= 1'b0;
            sel_muxAlu <= 1'b0;
            sel_muxDisplay <= 1'b0;
            clr_opCode <= 1'b0;
            opCodeOut <= 3'b000;
            E0 <= 1'b1;
            E1 <= 1'b0;
            E2 <= 1'b0;
            E3 <= 1'b0;
        end
        else begin
            case (state)
                S0: begin
                    if (opCodeIn == 3'b001) begin
                        state <= S1;
                        ld_number <= 1'b1;
                        sel_muxDisplay <= 1'b0;
                    end
                    else begin
                        state <= S0;
                        ld_number <= 1'b0;
                        sel_muxDisplay <= 1'b0;
                    end
                    clr_number <= 1'b0;
                    ld_opcode <= 1'b0;
                    ld_result <= 1'b0;
                    clr_result <= 1'b0;
                    sel_muxAlu <= 1'b0;
                    clr_opCode <= 1'b0;
                    opCodeOut <= opCodeIn;
                    E0 <= 1'b1;
                    E1 <= 1'b0;
                    E2 <= 1'b0;
                    E3 <= 1'b0;
                end
                S1: begin
                    if (opCodeIn == 3'b010) begin
                        state <= S2;
                        ld_opcode <= 1'b1;
                        sel_muxAlu <= 1'b1;
                    end
                    else if (opCodeIn == 3'b011) begin
                        state <= S3;
                        ld_result <= 1'b1;
                    end
                    else begin
                        state <= S1;
                        ld_result <= 1'b1;
                    end
                    ld_number <= 1'b0;
                    clr_number <= 1'b0;
                    clr_result <= 1'b0;
                    sel_muxDisplay <= 1'b1;
                    clr_opCode <= 1'b0;
                    opCodeOut <= opCodeIn;
                    E0 <= 1'b0;
                    E1 <= 1'b1;
                    E2 <= 1'b0;
                    E3 <= 1'b0;
                end
                S2: begin
                    if (opCodeIn == 3'b001) begin
                        state <= S1;
                        ld_number <= 1'b1;
                        clr_number <= 1'b1;
                    end
                    else if (opCodeIn == 3'b010) begin
                        state <= S2;
                        clr_number <= 1'b1;
                    end
                    else begin
                        state <= S2;
                        clr_number <= 1'b0;
                    end
                    ld_opcode <= 1'b0;
                    ld_result <= 1'b0;
                    clr_result <= 1'b0;
                    sel_muxAlu <= 1'b0;
                    sel_muxDisplay <= 1'b1;
                    clr_opCode <= 1'b0;
                    opCodeOut <= opCodeIn;
                    E0 <= 1'b0;
                    E1 <= 1'b0;
                    E2 <= 1'b1;
                    E3 <= 1'b0;
                end
                S3: begin
                    if (opCodeIn == 3'b011) begin
                        state <= S2;
                        ld_result <= 1'b1;
                        clr_result <= 1'b1;
                    end
                    else if (opCodeIn == 3'b010) begin
                        state <= S2;
                        ld_opcode <= 1'b1;
                        clr_result <= 1'b1;
                    end
                    else begin
                        state <= S3;
                        ld_result <= 1'b1;
                        clr_result <= 1'b0;
                    end
                    ld_number <= 1'b0;
                    clr_number <= 1'b0;
                    sel_muxAlu <= 1'b0;
                    sel_muxDisplay <= 1'b1;
                    clr_opCode <= 1'b0;
                    opCodeOut <= opCodeIn;
                    E0 <= 1'b0;
                    E1 <= 1'b0;
                    E2 <= 1'b0;
                    E3 <= 1'b1;
                end
            endcase
        end
    end

endmodule
`timescale 1ns / 100ps

module origen_122904 (
    input wire nCrank, nFork, nTrip, nMode, clock, nRst,
    output reg nCrank_deglitch, nFork_deglitch, nTrip_deglitch, nMode_deglitch,
    output reg readyM, readyT
);

    // State definitions
    localparam s0 = 1'b0, s1 = 1'b1;

    // State and counter registers
    reg stateC, stateF, stateT, stateM;
    reg [8:0] deglitchC, deglitchF, deglitchT, deglitchM;

    // Deglitch process for nCrank
    always @(posedge clock or negedge nRst) begin
        if (!nRst) begin
            stateC <= s0;
            deglitchC <= 9'd0;
            nCrank_deglitch <= 1'b1;
        end else begin
            case (stateC)
                s0: begin
                    nCrank_deglitch <= nCrank;
                    if (!nCrank) stateC <= s1;
                end
                s1: begin
                    if (nCrank) begin
                        if (deglitchC == 9'd320) begin
                            nCrank_deglitch <= 1'b1;
                            stateC <= s0;
                        end
                        deglitchC <= deglitchC + 1'b1;
                    end else begin
                        deglitchC <= 9'd0;
                        stateC <= s0;
                    end
                end
            endcase
        end
    end

    // Deglitch process for nFork
    always @(posedge clock or negedge nRst) begin
        if (!nRst) begin
            stateF <= s0;
            deglitchF <= 9'd0;
            nFork_deglitch <= 1'b1;
        end else begin
            case (stateF)
                s0: begin
                    nFork_deglitch <= nFork;
                    if (!nFork) stateF <= s1;
                end
                s1: begin
                    if (nFork) begin
                        if (deglitchF == 9'd320) begin
                            nFork_deglitch <= 1'b1;
                            stateF <= s0;
                        end
                        deglitchF <= deglitchF + 1'b1;
                    end else begin
                        deglitchF <= 9'd0;
                        stateF <= s0;
                    end
                end
            endcase
        end
    end

    // Deglitch process for nTrip
    always @(posedge clock or negedge nRst) begin
        if (!nRst) begin
            stateT <= s0;
            deglitchT <= 9'd0;
            nTrip_deglitch <= 1'b1;
            readyT <= 1'b0;
        end else begin
            case (stateT)
                s0: begin
                    nTrip_deglitch <= nTrip;
                    if (!nTrip) begin
                        stateT <= s1;
                        readyT <= 1'b1;
                    end
                end
                s1: begin
                    if (nTrip) begin
                        if (deglitchT == 9'd320) begin
                            nTrip_deglitch <= 1'b1;
                            stateT <= s0;
                            readyT <= 1'b0;
                        end
                        deglitchT <= deglitchT + 1'b1;
                    end else begin
                        deglitchT <= 9'd0;
                    end
                end
            endcase
        end
    end

    // Deglitch process for nMode
    always @(posedge clock or negedge nRst) begin
        if (!nRst) begin
            stateM <= s0;
            deglitchM <= 9'd0;
            nMode_deglitch <= 1'b1;
            readyM <= 1'b0;
        end else begin
            case (stateM)
                s0: begin
                    nMode_deglitch <= nMode;
                    if (!nMode) begin
                        stateM <= s1;
                        readyM <= 1'b1;
                    end
                end
                s1: begin
                    if (nMode) begin
                        if (deglitchM == 9'd320) begin
                            nMode_deglitch <= 1'b1;
                            stateM <= s0;
                            readyM <= 1'b0;
                        end
                        deglitchM <= deglitchM + 1'b1;
                    end else begin
                        deglitchM <= 9'd0;
                    end
                end
            endcase
        end
    end

endmodule
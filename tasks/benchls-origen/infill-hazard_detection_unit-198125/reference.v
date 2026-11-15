module origen_198125(
    input PCSrc_i,
    input EX_MemRead_i,
    input [9:0] IFID_RSRT_i,
    input [4:0] IDEX_RT_i,
    output reg PCWrite_o,
    output reg IFIDStall_o,
    output reg IFFlush_o,
    output reg IDFlush_o,
    output reg EXFlush_o
);

always @(*) begin
    case (PCSrc_i)
        1'b1: begin
            // Control hazard (branch or exception)
            PCWrite_o = 1'b1;
            IFFlush_o = 1'b1;
            IDFlush_o = 1'b1;
            EXFlush_o = 1'b1;
            IFIDStall_o = 1'b0;
        end
        1'b0: begin
            // Data hazard
            if (EX_MemRead_i && (IDEX_RT_i == IFID_RSRT_i[4:0] || IDEX_RT_i == IFID_RSRT_i[9:5])) begin
                // Data hazard detected
                PCWrite_o = 1'b0;
                IFIDStall_o = 1'b1;
                IDFlush_o = 1'b1;
                IFFlush_o = 1'b0;
                EXFlush_o = 1'b0;
            end
            else begin
                // No data hazard
                PCWrite_o = 1'b1;
                IFIDStall_o = 1'b0;
                IFFlush_o = 1'b0;
                IDFlush_o = 1'b0;
                EXFlush_o = 1'b0;
            end
        end
        default: begin
            PCWrite_o = 1'b0;
            IFIDStall_o = 1'b0;
            IFFlush_o = 1'b0;
            IDFlush_o = 1'b0;
            EXFlush_o = 1'b0;
        end
    endcase
end

endmodule
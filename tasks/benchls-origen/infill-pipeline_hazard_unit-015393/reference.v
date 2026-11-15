module origen_015393(
    input wire branch_d, regwrite_e, memtoreg_e, memtoreg_m,
    input wire [4:0] writereg_e, rs_d, rt_d, rt_e, writereg_m,
    input wire memread_m, memwrite_m, memready_m,
    input wire branchtaken_e, branchfound_e, jump_d,
    output reg stall_f, stall_d, stall_e, stall_m, stall_w,
    output reg flush_f, flush_d, flush_e, flush_m, flush_w
);

    wire branch_stall, lw_stall, mem_stall, new_branch;

    // Branch Hazard Detection
    assign branch_stall = (branch_d && regwrite_e && (writereg_e == rs_d || writereg_e == rt_d)) ||
                          (branch_d && memtoreg_m && (writereg_m == rs_d || writereg_m == rt_d));

    // Load-Use Hazard Detection
    assign lw_stall = memtoreg_e && (rt_e == rs_d || rt_e == rt_d);

    // Memory Stall Detection
    assign mem_stall = (memread_m || memwrite_m) && !memready_m;

    // Branch Prediction and Correction
    assign new_branch = branchtaken_e && branchfound_e;

    // Hazard Resolution Logic
    always @(*) begin
        // Default: No stalls or flushes
        {stall_f, stall_d, stall_e, stall_m, stall_w} = 5'b00000;
        {flush_f, flush_d, flush_e, flush_m, flush_w} = 5'b00000;

        if (new_branch) begin
            // Branch misprediction
            flush_f = 1'b1;
            flush_d = 1'b1;
            flush_e = 1'b1;
        end else if (jump_d) begin
            // Jump instruction
            flush_f = 1'b1;
            flush_d = 1'b1;
        end else if (branch_stall || lw_stall) begin
            // Data hazard
            stall_f = 1'b1;
            stall_d = 1'b1;
            flush_e = 1'b1;
        end

        if (mem_stall) begin
            // Memory stall
            stall_f = 1'b1;
            stall_d = 1'b1;
            stall_e = 1'b1;
            stall_m = 1'b1;
            stall_w = 1'b1;
        end
    end

endmodule
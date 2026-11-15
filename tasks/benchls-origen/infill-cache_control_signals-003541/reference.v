module origen_003541 (
    input wire clk,
    input wire imiss, dmiss, ifill, dfill, jump,
    input wire [1:0] remaining_stores,
    output reg we1, we2, we3, we4, we5,
    output reg reset2, reset3, reset4, reset5
);

    reg ifill_d, dfill_d;

    always @(posedge clk) begin
        ifill_d <= ifill;
        dfill_d <= dfill;
    end

    always @(*) begin
        we1 = ~imiss;
        we2 = ~(imiss | dmiss);
        we3 = ~(imiss | dmiss);
        we4 = ~(imiss | dmiss);
        we5 = ~(imiss | dmiss) & (remaining_stores == 2'b00);

        reset2 = jump | ifill_d;
        reset3 = jump | ifill_d | dfill_d;
        reset4 = jump | ifill_d | dfill_d;
        reset5 = jump | ifill_d | dfill_d;
    end

    initial begin
        we1 = 1'b1;
        we2 = 1'b1;
        we3 = 1'b1;
        we4 = 1'b1;
        we5 = 1'b1;
        reset2 = 1'b0;
        reset3 = 1'b0;
        reset4 = 1'b0;
        reset5 = 1'b0;
        ifill_d = 1'b0;
        dfill_d = 1'b0;
    end

endmodule

module exception_regs (
    input wire clk,
    input wire exc1, exc2, exc3, exc4,
    output reg exc2_r, exc3_r, exc4_r, exc5_r
);

    always @(posedge clk) begin
        exc2_r <= exc1;
        exc3_r <= exc2 | exc2_r;
        exc4_r <= exc3 | exc3_r;
        exc5_r <= exc4 | exc4_r;
    end

endmodule
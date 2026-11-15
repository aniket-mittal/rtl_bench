module origen_201018(
    input CLOCK, RESET, Data_RDY, interpolate_count, shift_done, loaded,
    output reg interpolate_count_ENP, CIC_en, pulse_slow, pulse_fast, data_select, sample_rdy, load_result_slow, load_result_fast
);

reg [3:0] Sreg, Snext;

localparam INIT = 4'd0,
           LOAD_SLOW1 = 4'd1, LOAD_SLOW2 = 4'd2,
           LOAD_FAST1 = 4'd3, LOAD_FAST2 = 4'd4,
           WAIT = 4'd5,
           SEND = 4'd6,
           LOAD_FAST_INIT1 = 4'd7, LOAD_FAST_INIT2 = 4'd8;

always @(posedge CLOCK or posedge RESET) begin
    if (RESET)
        Sreg <= INIT;
    else
        Sreg <= Snext;
end

[MASKED]

always @(*) begin
    // Default output values
    interpolate_count_ENP = 1'b0;
    CIC_en = 1'b0;
    pulse_slow = 1'b0;
    pulse_fast = 1'b0;
    data_select = 1'b0;
    sample_rdy = 1'b0;
    load_result_slow = 1'b0;
    load_result_fast = 1'b0;

    case (Sreg)
        INIT:
            ;
        LOAD_SLOW1:
            load_result_slow = 1'b1;
        LOAD_SLOW2:
            load_result_slow = 1'b1;
        LOAD_FAST_INIT1:
            ;
        LOAD_FAST_INIT2:
            ;
        LOAD_FAST1:
            load_result_fast = 1'b1;
        LOAD_FAST2:
            load_result_fast = 1'b1;
        WAIT:
            ;
        SEND:
            begin
                interpolate_count_ENP = 1'b1;
                CIC_en = 1'b1;
                pulse_slow = 1'b1;
                pulse_fast = 1'b1;
                data_select = 1'b1;
                sample_rdy = 1'b1;
            end
        default:
            ;
    endcase
end

endmodule
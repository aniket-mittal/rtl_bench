module origen_110354 #(
    parameter NUM_WAYS = 4
) (
    input [NUM_WAYS-1:0] hit_way,
    input [2:0] lru_curstate,
    output reg [2:0] lru_updstate,
    output reg [NUM_WAYS-1:0] rep_dec
);

    reg [3:0] lru_hitway;
    reg [1:0] lru_repdec;

    always @(*) begin
        // Step 1: Hit Way Encoding
        case (NUM_WAYS)
            1: lru_hitway = 4'b0001;
            2: lru_hitway = {2'b00, hit_way};
            4: lru_hitway = hit_way;
            default: lru_hitway = 4'b0000;
        endcase

        // Step 2: LRU State Update
        case (NUM_WAYS)
            1: lru_updstate = lru_curstate;
            2: lru_updstate = {2'b00, lru_hitway[0]};
            4: begin
                lru_updstate[2] = lru_hitway[3] | lru_hitway[2];
                lru_updstate[1] = lru_hitway[3] | lru_hitway[1];
                lru_updstate[0] = lru_hitway[3] ? lru_hitway[2] : lru_hitway[1];
            end
            default: lru_updstate = 3'b000;
        endcase

        // Step 3: Replacement Way Selection
        case (NUM_WAYS)
            1: lru_repdec = 2'b00;
            2: lru_repdec = {1'b0, ~lru_updstate[0]};
            4: begin
                lru_repdec[1] = ~lru_updstate[2];
                lru_repdec[0] = lru_updstate[2] ? ~lru_updstate[1] : ~lru_updstate[0];
            end
            default: lru_repdec = 2'b00;
        endcase

        // Step 4: Output Encoding
        case (NUM_WAYS)
            1: rep_dec = 1'b1;
            2: rep_dec = (lru_repdec[0]) ? 2'b10 : 2'b01;
            4: rep_dec = 4'b0001 << lru_repdec;
            default: rep_dec = {NUM_WAYS{1'b0}};
        endcase
    end

endmodule
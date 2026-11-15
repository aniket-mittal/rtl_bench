module origen_085118 (
    input wire clk,
    input wire reset,
    input wire [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
);

    // State encoding
    localparam [3:0] BL1 = 4'b0000,
                     BTW12 = 4'b0001,
                     BTW23 = 4'b0010,
                     ABV3 = 4'b0011,
                     BTW23_DOWN = 4'b0100,
                     BTW12_DOWN = 4'b0101,
                     BL1_DOWN = 4'b0110,
                     IDLE_STS = 4'b0111;

    reg [3:0] current_state, next_state;

    // State register
    always @(posedge clk) begin
        if (reset)
            current_state <= IDLE_STS;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            BL1: next_state = (s[1]) ? BTW12 : BL1;
            BTW12: next_state = (s[2]) ? BTW23 : (s[1]) ? BTW12 : BL1;
            BTW23: next_state = (s[3]) ? ABV3 : (s[2]) ? BTW23 : BTW12;
            ABV3: next_state = (s[3]) ? ABV3 : BTW23_DOWN;
            BTW23_DOWN: next_state = (s[3]) ? ABV3 : (s[2]) ? BTW23_DOWN : BTW12_DOWN;
            BTW12_DOWN: next_state = (s[2]) ? BTW23 : (s[1]) ? BTW12_DOWN : BL1_DOWN;
            BL1_DOWN: next_state = (s[1]) ? BTW12 : BL1_DOWN;
            IDLE_STS: next_state = (s[1]) ? BTW12 : BL1;
            default: next_state = IDLE_STS;
        endcase
    end

    // Output logic
    always @(*) begin
        fr3 = (current_state == BL1) || (current_state == BL1_DOWN) || (current_state == IDLE_STS);
        fr2 = (current_state == BL1) || (current_state == BTW12) || (current_state == BL1_DOWN) || (current_state == BTW12_DOWN);
        fr1 = (current_state != ABV3);
        dfr = (current_state == BTW23_DOWN) || (current_state == BTW12_DOWN) || (current_state == BL1_DOWN) || (current_state == IDLE_STS);
    end

endmodule
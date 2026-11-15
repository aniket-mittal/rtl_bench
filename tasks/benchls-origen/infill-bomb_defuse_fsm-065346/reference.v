module origen_065346 (
    input wire clock_65mhz,
    input wire reset,
    input wire enable,
    input wire [3:0] user_in,
    output reg strike,
    output reg module_defused,
    output reg [2:0] user_out
);

    // State definitions
    localparam [1:0] PINONE = 2'b00, PINTHREE = 2'b01, PINFIVE = 2'b10;
    localparam [2:0] START = 3'b000, FIRST = 3'b001, SECOND = 3'b010, THIRD = 3'b011,
                     FOURTH = 3'b100, FIFTH = 3'b101, SIXTH = 3'b110, DONE = 3'b111;

    reg [1:0] states_out;
    reg [2:0] keys_states;
    reg [11:0] keys;

    always @(posedge clock_65mhz or posedge reset) begin
        if (reset) begin
            states_out <= PINONE;
            keys_states <= START;
            keys <= 12'b0;
            strike <= 1'b0;
            module_defused <= 1'b0;
            user_out <= 3'b0;
        end else if (enable) begin
            // Pin State Machine
            case (states_out)
                PINONE: begin
                    keys[11:8] <= user_in;
                    states_out <= PINTHREE;
                end
                PINTHREE: begin
                    keys[7:4] <= user_in;
                    states_out <= PINFIVE;
                end
                PINFIVE: begin
                    keys[3:0] <= user_in;
                    states_out <= PINONE;
                end
            endcase

            // Key Sequence State Machine
            case (keys_states)
                START: begin
                    if (keys == 12'h110) keys_states <= FIRST;
                    else strike <= 1'b1;
                end
                FIRST: begin
                    if (keys == 12'h000) keys_states <= SECOND;
                    else begin
                        keys_states <= START;
                        strike <= 1'b1;
                    end
                end
                SECOND: begin
                    if (keys == 12'h009) keys_states <= THIRD;
                    else begin
                        keys_states <= START;
                        strike <= 1'b1;
                    end
                end
                THIRD: begin
                    if (keys == 12'h006) keys_states <= FOURTH;
                    else begin
                        keys_states <= START;
                        strike <= 1'b1;
                    end
                end
                FOURTH: begin
                    if (keys == 12'h007) keys_states <= FIFTH;
                    else begin
                        keys_states <= START;
                        strike <= 1'b1;
                    end
                end
                FIFTH: begin
                    if (keys == 12'h004) keys_states <= SIXTH;
                    else begin
                        keys_states <= START;
                        strike <= 1'b1;
                    end
                end
                SIXTH: begin
                    if (keys == 12'h003) keys_states <= DONE;
                    else begin
                        keys_states <= START;
                        strike <= 1'b1;
                    end
                end
                DONE: begin
                    module_defused <= 1'b1;
                end
            endcase

            user_out <= keys_states;
        end
    end

endmodule
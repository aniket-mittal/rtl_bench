module origen_037615 (
    input wire clk,
    input wire reset,
    input wire [7:0] data,
    input wire send,
    input wire rs_in,
    input wire rw_in,
    output reg E,
    output reg RS,
    output reg RW,
    output reg [3:0] D,
    output reg done
);

    // Parameters for timing
    parameter SETUP_TIME = 5;
    parameter HOLD_TIME = 5;
    parameter DELAY_TIME = 5;

    // State encoding
    parameter [2:0] 
        STATE1 = 3'd0,
        STATE2 = 3'd1,
        STATE3 = 3'd2,
        STATE4 = 3'd3,
        STATE5 = 3'd4,
        STATE6 = 3'd5,
        STATE7 = 3'd6;

    reg [2:0] state, next_state;
    reg [7:0] counter;
    reg second_nibble;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= STATE1;
            counter <= 0;
            second_nibble <= 0;
            E <= 0;
            RS <= 0;
            RW <= 0;
            D <= 4'b0000;
            done <= 0;
        end else begin
            state <= next_state;
            
            case (state)
                STATE1: begin
                    if (send) begin
                        RS <= rs_in;
                        RW <= rw_in;
                        counter <= 0;
                        second_nibble <= 0;
                        done <= 0;
                    end
                end
                
                STATE2, STATE5: begin
                    counter <= counter + 1;
                    E <= 0;
                    D <= second_nibble ? data[3:0] : data[7:4];
                end
                
                STATE3, STATE6: begin
                    counter <= counter + 1;
                    E <= 1;
                end
                
                STATE4: begin
                    counter <= counter + 1;
                    E <= 0;
                    second_nibble <= 1;
                end
                
                STATE7: begin
                    counter <= counter + 1;
                    E <= 0;
                    if (counter == DELAY_TIME - 1) done <= 1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            STATE1: next_state = send ? STATE2 : STATE1;
            STATE2: next_state = (counter == SETUP_TIME - 1) ? STATE3 : STATE2;
            STATE3: next_state = (counter == HOLD_TIME - 1) ? STATE4 : STATE3;
            STATE4: next_state = (counter == DELAY_TIME - 1) ? STATE5 : STATE4;
            STATE5: next_state = (counter == SETUP_TIME - 1) ? STATE6 : STATE5;
            STATE6: next_state = (counter == HOLD_TIME - 1) ? STATE7 : STATE6;
            STATE7: next_state = (counter == DELAY_TIME - 1) ? STATE1 : STATE7;
            default: next_state = STATE1;
        endcase
    end

endmodule
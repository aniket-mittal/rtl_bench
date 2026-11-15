module origen_162149 (
    input clkFSM,
    input resetFSM,
    input initDone,
    input writeDone,
    input [3:0] input_data,
    input update,
    output reg [7:0] data,
    output reg writeStart,
    output reg lcd_clear
);

    localparam IDLE = 3'b000, 
               DATA1 = 3'b001, WAIT1 = 3'b010,
               DATA2 = 3'b011, WAIT2 = 3'b100,
               WAITCLEAR = 3'b101, FINISH = 3'b110,
               CLEAR = 3'b111, COUNTWAIT = 4'b1000,
               DATA10 = 4'b1001, WAIT10 = 4'b1010,
               DONE = 4'b1011;

    reg [3:0] state, next_state;
    reg [3:0] digit1, digit2;

    always @(posedge clkFSM or posedge resetFSM) begin
        if (resetFSM) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (initDone) begin
                    next_state = DATA1;
                end
            end
            DATA1: begin
                next_state = WAIT1;
            end
            WAIT1: begin
                if (writeDone) begin
                    next_state = DATA2;
                end
            end
            DATA2: begin
                next_state = WAIT2;
            end
            WAIT2: begin
                if (writeDone) begin
                    next_state = WAITCLEAR;
                end
            end
            WAITCLEAR: begin
                if (writeDone) begin
                    next_state = FINISH;
                end
            end
            FINISH: begin
                if (update) begin
                    next_state = CLEAR;
                end
                else begin
                    next_state = DONE;
                end
            end
            CLEAR: begin
                next_state = COUNTWAIT;
            end
            COUNTWAIT: begin
                if (writeDone) begin
                    next_state = IDLE;
                end
            end
            DATA10: begin
                next_state = WAIT10;
            end
            WAIT10: begin
                if (writeDone) begin
                    next_state = FINISH;
                end
            end
            DONE: begin
                if (update) begin
                    next_state = DATA1;
                end
                else begin
                    next_state = DONE;
                end
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    always @(posedge clkFSM) begin
        case (state)
            IDLE: begin
                writeStart <= 0;
                lcd_clear <= 0;
            end
            DATA1: begin
                digit1 <= input_data;
                data <= {4'b0000, digit1};
                writeStart <= 1;
            end
            WAIT1: begin
                writeStart <= 0;
            end
            DATA2: begin
                digit2 <= input_data;
                data <= {4'b0000, digit2};
                writeStart <= 1;
            end
            WAIT2: begin
                writeStart <= 0;
            end
            WAITCLEAR: begin
                lcd_clear <= 1;
            end
            FINISH: begin
                lcd_clear <= 0;
            end
            CLEAR: begin
                lcd_clear <= 1;
            end
            COUNTWAIT: begin
                lcd_clear <= 0;
            end
            DATA10: begin
                digit1 <= 4'b1010; // 'A'
                data <= {4'b0000, digit1};
                writeStart <= 1;
            end
            WAIT10: begin
                writeStart <= 0;
            end
            DONE: begin
                // Do nothing
            end
            default: begin
                // Do nothing
            end
        endcase
    end

endmodule
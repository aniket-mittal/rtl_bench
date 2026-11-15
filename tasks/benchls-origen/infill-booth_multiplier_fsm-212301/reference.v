module origen_212301(
    input start,
    input sign,
    input clk,
    input reset,
    output reg load,
    output reg add,
    output reg shift,
    output reg inbit,
    output reg [1:0] sel,
    output reg valid
);

    reg [2:0] curr_state, next_state;
    reg [4:0] count;

    parameter IDLE = 3'b000, LOAD = 3'b001, SHIFT = 3'b010, ADD = 3'b011, DONE = 3'b100;

    always @(*) begin
        case (curr_state)
            IDLE: begin
                if (start) begin
                    next_state = LOAD;
                end else begin
                    next_state = IDLE;
                end
            end
            LOAD: begin
                if (sign) begin
                    next_state = ADD;
                end else begin
                    next_state = SHIFT;
                end
            end
            SHIFT: begin
                next_state = SHIFT;
                if (count == 17) begin
                    next_state = DONE;
                end
            end
            ADD: begin
                next_state = SHIFT;
            end
            DONE: begin
                next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            curr_state <= IDLE;
        end else begin
            curr_state <= next_state;
        end
    end

    always @(curr_state) begin
        case (curr_state)
            IDLE: begin
                load <= 0;
                add <= 0;
                shift <= 0;
                inbit <= 0;
                sel <= 2'b00;
                valid <= 0;
            end
            LOAD: begin
                load <= 1;
                add <= 0;
                shift <= 0;
                inbit <= 0;
                sel <= 2'b01;
                valid <= 0;
            end
            SHIFT: begin
                load <= 0;
                add <= 0;
                shift <= 1;
                inbit <= sign;
                sel <= 2'b10;
                valid <= 0;
            end
            ADD: begin
                load <= 0;
                add <= 1;
                shift <= 0;
                inbit <= 0;
                sel <= 2'b11;
                valid <= 0;
            end
            DONE: begin
                load <= 0;
                add <= 0;
                shift <= 0;
                inbit <= 0;
                sel <= 2'b00;
                valid <= 1;
            end
            default: begin
                load <= 0;
                add <= 0;
                shift <= 0;
                inbit <= 0;
                sel <= 2'b00;
                valid <= 0;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
        end else if (start) begin
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end

endmodule
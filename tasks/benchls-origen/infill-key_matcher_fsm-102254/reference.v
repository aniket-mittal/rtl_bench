module origen_102254(
    input wire clok, resetm,
    output reg [9:0] LEDS,
    input wire new_char, new_key, start_over,
    output reg found_key, matched_cont, done, last_key,
    input wire [7:0] char_recieved,
    input wire [5:0] char_count,
    output reg [23:0] key,
    output reg compared_char
);

    // State definitions
    localparam [2:0]
        wait_for_next_char = 3'b000,
        check_char = 3'b001,
        get_next_key = 3'b010,
        one_wait = 3'b011,
        reached_last_char = 3'b100,
        reached_last_key = 3'b101,
        finished_string = 3'b110;

    reg [2:0] state, next_state;
    reg [23:0] next_key;
    reg [5:0] char_counter;

    // State machine
    always @(posedge clok or posedge resetm) begin
        if (resetm) begin
            state <= wait_for_next_char;
            key <= 24'h000000;
            char_counter <= 6'b0;
            LEDS <= 10'b0;
        end else begin
            state <= next_state;
            key <= next_key;
            if (new_char) char_counter <= char_counter + 1;
            LEDS <= {state, char_counter[3:0], found_key, matched_cont, done};
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        next_key = key;
        found_key = 1'b0;
        matched_cont = 1'b0;
        done = 1'b0;
        last_key = 1'b0;
        compared_char = 1'b0;

        case (state)
            wait_for_next_char: begin
                if (new_char) next_state = check_char;
            end

            check_char: begin
                compared_char = 1'b1;
                if ((char_recieved >= 8'd97 && char_recieved <= 8'd122) || char_recieved == 8'd32) begin
                    matched_cont = 1'b1;
                    if (char_counter == char_count) 
                        next_state = finished_string;
                    else 
                        next_state = wait_for_next_char;
                end else begin
                    next_state = reached_last_char;
                end
            end

            get_next_key: begin
                if (new_key) begin
                    next_key = key + 1;
                    next_state = one_wait;
                end
            end

            one_wait: begin
                next_state = wait_for_next_char;
            end

            reached_last_char: begin
                if (start_over) begin
                    next_key = {~key[23:16], ~key[15:8], ~key[7:0]};
                    next_state = one_wait;
                end else if (new_key) begin
                    next_key = key + 1;
                    next_state = one_wait;
                end
            end

            reached_last_key: begin
                last_key = 1'b1;
                if (start_over) next_state = one_wait;
            end

            finished_string: begin
                found_key = 1'b1;
                done = 1'b1;
            end
        endcase
    end

endmodule
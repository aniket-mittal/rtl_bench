module rtlpp_00210 (
    input clk,
    input rst_n,
    output reg div_clk,
    output reg done
);

    // State definitions
    parameter STATE_DIVIDE_BY_3 = 2'b00;
    parameter STATE_DIVIDE_BY_4 = 2'b01;

    // Internal counter and state registers
    reg [10:0] count_divide_by_3;
    reg [7:0] count_divide_by_4;
    reg [1:0] state;
    reg [1:0] pulse_counter;
    reg [1:0] pulse_counter2;

    // First always block to update state and counters
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= STATE_DIVIDE_BY_3;
            count_divide_by_3 <= 0;
            count_divide_by_4 <= 0;
            pulse_counter <= 2'b00;
            pulse_counter2 <= 2'b00;
        end else begin
            case (state)
                STATE_DIVIDE_BY_3: begin
                    if (count_divide_by_3 == 1072) begin
                        state <= STATE_DIVIDE_BY_4;
                        pulse_counter <= 2'b00;
                        count_divide_by_3 <= 0;
                    end else begin
                        if (pulse_counter < 3) begin
                            pulse_counter <= pulse_counter + 1;
                        end else begin
                            pulse_counter <= 2'b00;
                            if (div_clk) begin
                                count_divide_by_3 <= count_divide_by_3 + 1;
                            end
                        end
                    end
                end
                STATE_DIVIDE_BY_4: begin
                    if (count_divide_by_4 == 176) begin
                        pulse_counter2 <= 0;
                        state <= STATE_DIVIDE_BY_3;
                        count_divide_by_4 <= 0;
                    end else begin
                        if (pulse_counter2 < 4) begin
                            pulse_counter2 <= pulse_counter2 + 1;
                        end else begin
                            pulse_counter2 <= 2'b00;
                        end
                        if (div_clk) begin
                            count_divide_by_4 <= count_divide_by_4 + 1;
                        end
                    end
                end
            endcase
        end
    end

    // Second always block to generate div_clk and done signals
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            div_clk <= 1'b0;
            done <= 1'b0;
        end else begin
            case (state)
                STATE_DIVIDE_BY_3: begin
                    done <= 0;
                    if (pulse_counter == 2) begin
                        div_clk <= 1;
                    end else begin
                        div_clk <= 0;
                    end
                end
                STATE_DIVIDE_BY_4: begin
                    if (count_divide_by_4 == 176) begin
                        done <= 1'b1;
                    end else begin
                        if (pulse_counter2 == 3) begin
                            div_clk <= 1;
                        end else begin
                            div_clk <= 0;
                        end
                    end
                end
            endcase
        end
    end
endmodule
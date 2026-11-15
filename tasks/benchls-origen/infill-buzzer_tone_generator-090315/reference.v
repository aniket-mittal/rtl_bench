module origen_090315 (
    input wire clk,
    input wire rst,
    input wire [7:0] sound,
    output reg buzzer
);

    reg [18:0] buzzer_counter;
    reg [7:0] sound_d;
    reg [26:0] delay_counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            buzzer_counter <= 19'b0;
            sound_d <= 8'b0;
            delay_counter <= 27'b0;
            buzzer <= 1'b0;
        end else begin
            // Sound Input Processing
            if (sound != 8'b0 && delay_counter == 27'b0) begin
                sound_d <= sound;
                delay_counter <= 27'd100000000; // Set delay
            end else if (delay_counter > 27'b0) begin
                delay_counter <= delay_counter - 1'b1;
            end

            // Buzzer Control
            case (sound_d)
                8'b00000001: begin // Mode 1
                    buzzer_counter <= (buzzer_counter == 19'd500000) ? 19'b0 : buzzer_counter + 1'b1;
                    buzzer <= buzzer_counter[18];
                end
                8'b00000010: begin // Mode 2
                    buzzer_counter <= (buzzer_counter == 19'd400000) ? 19'b0 : buzzer_counter + 1'b1;
                    buzzer <= buzzer_counter[17];
                end
                8'b00000100: begin // Mode 3
                    buzzer_counter <= (buzzer_counter == 19'd300000) ? 19'b0 : buzzer_counter + 1'b1;
                    buzzer <= buzzer_counter[16];
                end
                8'b00001000: begin // Mode 4
                    buzzer_counter <= (buzzer_counter == 19'd200000) ? 19'b0 : buzzer_counter + 1'b1;
                    buzzer <= buzzer_counter[15];
                end
                default: begin
                    buzzer_counter <= 19'b0;
                    buzzer <= 1'b0;
                end
            endcase
        end
    end

endmodule
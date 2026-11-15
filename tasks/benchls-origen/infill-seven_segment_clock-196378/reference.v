module origen_196378 (
    input disp_clk,
    input blink_clk,
    input [7:0] minutes,
    input [7:0] seconds,
    input adj,
    input sel,
    output reg [3:0] AN0, AN1, AN2, AN3,
    output reg CA, CB, CC, CD, CE, CF, CG
);

    reg [6:0] numbers [0:9];
    reg [6:0] nothing = 7'b1111111;
    reg [6:0] cur_disp_value;
    reg [3:0] anodes;
    reg [3:0] cur_anode;
    reg [3:0] nums_to_display [0:3];
    reg blink_minutes, blink_seconds;

    initial begin
        // Initialize the numbers array
        numbers[0] = 7'b1000000;
        numbers[1] = 7'b1111001;
        numbers[2] = 7'b0100100;
        numbers[3] = 7'b0110000;
        numbers[4] = 7'b0011001;
        numbers[5] = 7'b0010010;
        numbers[6] = 7'b0000010;
        numbers[7] = 7'b1111000;
        numbers[8] = 7'b0000000;
        numbers[9] = 7'b0010000;
    end

    always @(posedge disp_clk) begin
        // Determine the digits to be displayed
        nums_to_display[0] = minutes[3:0];
        nums_to_display[1] = minutes[7:4];
        nums_to_display[2] = seconds[3:0];
        nums_to_display[3] = seconds[7:4];

        // Handle blinking
        if (adj) begin
            if (sel) begin
                blink_minutes = ~blink_minutes;
                blink_seconds = 0;
            end else begin
                blink_seconds = ~blink_seconds;
                blink_minutes = 0;
            end
        end else begin
            blink_minutes = 0;
            blink_seconds = 0;
        end

        // Cycle through the four digits
        anodes = {AN3, AN2, AN1, AN0};
        cur_anode = anodes[3:0];
        case (cur_anode)
            4'b1110: begin
                cur_disp_value = (blink_minutes && blink_clk) ? nothing : numbers[nums_to_display[0]];
                AN0 = 4'b1110;
            end
            4'b1101: begin
                cur_disp_value = (blink_minutes && blink_clk) ? nothing : numbers[nums_to_display[1]];
                AN1 = 4'b1101;
            end
            4'b1011: begin
                cur_disp_value = (blink_seconds && blink_clk) ? nothing : numbers[nums_to_display[2]];
                AN2 = 4'b1011;
            end
            4'b0111: begin
                cur_disp_value = (blink_seconds && blink_clk) ? nothing : numbers[nums_to_display[3]];
                AN3 = 4'b0111;
            end
            default: begin
                cur_disp_value = nothing;
                AN0 = 4'b1111;
                AN1 = 4'b1111;
                AN2 = 4'b1111;
                AN3 = 4'b1111;
            end
        endcase
    end

    always @(*) begin
        // Assign the cathode signals based on the current display value
        CA = ~cur_disp_value[0];
        CB = ~cur_disp_value[1];
        CC = ~cur_disp_value[2];
        CD = ~cur_disp_value[3];
        CE = ~cur_disp_value[4];
        CF = ~cur_disp_value[5];
        CG = ~cur_disp_value[6];
    end

endmodule
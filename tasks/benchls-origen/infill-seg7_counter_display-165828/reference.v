module origen_165828(
    input clk,
    input reset,
    output reg [3:0] an,
    output reg [6:0] sseg
);

reg [18:0] ms_count;
reg [8:0] displayed_number;
reg [20:0] refresh_count;
reg [1:0] LED_activating_counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ms_count <= 0;
        displayed_number <= 0;
        refresh_count <= 0;
        LED_activating_counter <= 0;
    end
    else begin
        ms_count <= ms_count + 1;
        refresh_count <= refresh_count + 1;
        
        if (ms_count == 999_999) begin
            ms_count <= 0;
            displayed_number <= displayed_number + 1;
        end
        
        LED_activating_counter <= refresh_count[1:0];
    end
end

always @(*) begin
    case (LED_activating_counter)
        2'b00: an = 4'b1110;
        2'b01: an = 4'b1101;
        2'b10: an = 4'b1011;
        2'b11: an = 4'b0111;
    endcase
    
    case (displayed_number % 10)
        4'd0: sseg = 7'b1000000;
        4'd1: sseg = 7'b1111001;
        4'd2: sseg = 7'b0100100;
        4'd3: sseg = 7'b0110000;
        4'd4: sseg = 7'b0011001;
        4'd5: sseg = 7'b0010010;
        4'd6: sseg = 7'b0000010;
        4'd7: sseg = 7'b1111000;
        4'd8: sseg = 7'b0000000;
        4'd9: sseg = 7'b0010000;
    endcase
end

endmodule
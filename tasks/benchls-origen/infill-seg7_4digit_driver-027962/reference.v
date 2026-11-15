module origen_027962(
    input wire clk,
    input wire reset,
    input wire [3:0] digit0, digit1, digit2, digit3,
    output reg [6:0] seg,
    output reg dp,
    output reg [3:0] an
);

    reg [17:0] count;
    wire [1:0] sel;
    reg [3:0] digit;
    reg [6:0] sseg_temp;
    reg [3:0] an_temp;
    reg reg_dp;

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 18'd0;
        else
            count <= count + 1'b1;
    end

    assign sel = count[17:16];

    always @(*) begin
        case(sel)
            2'b00: begin digit = digit0; an_temp = 4'b1110; reg_dp = 1'b1; end
            2'b01: begin digit = digit1; an_temp = 4'b1101; reg_dp = 1'b1; end
            2'b10: begin digit = digit2; an_temp = 4'b1011; reg_dp = 1'b1; end
            2'b11: begin digit = digit3; an_temp = 4'b0111; reg_dp = 1'b0; end
        endcase
    end

    always @(*) begin
        case(digit)
            4'h0: sseg_temp = 7'b1000000;
            4'h1: sseg_temp = 7'b1111001;
            4'h2: sseg_temp = 7'b0100100;
            4'h3: sseg_temp = 7'b0110000;
            4'h4: sseg_temp = 7'b0011001;
            4'h5: sseg_temp = 7'b0010010;
            4'h6: sseg_temp = 7'b0000010;
            4'h7: sseg_temp = 7'b1111000;
            4'h8: sseg_temp = 7'b0000000;
            4'h9: sseg_temp = 7'b0010000;
            default: sseg_temp = 7'b1111111;
        endcase
    end

    always @(*) begin
        seg = sseg_temp;
        an = an_temp;
        dp = reg_dp;
    end

endmodule
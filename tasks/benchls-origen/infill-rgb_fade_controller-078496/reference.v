module origen_078496(
    input clk_div,
    input rst,
    output reg [7:0] R_time_in,
    output reg [7:0] G_time_in,
    output reg [7:0] B_time_in
);

    reg [1:0] c_state, n_state;
    reg [7:0] red, gre, blu;

    // State definitions
    localparam RED_EMPHASIS = 2'b00;
    localparam GREEN_EMPHASIS = 2'b01;
    localparam BLUE_EMPHASIS = 2'b10;

    // State transition and output logic
    always @(posedge clk_div or posedge rst) begin
        if (rst) begin
            c_state <= RED_EMPHASIS;
            red <= 8'd200;
            gre <= 8'd0;
            blu <= 8'd54;
        end else begin
            c_state <= n_state;
            red <= (red == 8'd255) ? red : (red + 8'd1);
            gre <= (gre == 8'd255) ? gre : (gre + 8'd1);
            blu <= (blu == 8'd255) ? blu : (blu + 8'd1);

            case (c_state)
                RED_EMPHASIS: blu <= (blu == 8'd0) ? blu : (blu - 8'd1);
                GREEN_EMPHASIS: red <= (red == 8'd0) ? red : (red - 8'd1);
                BLUE_EMPHASIS: gre <= (gre == 8'd0) ? gre : (gre - 8'd1);
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        case (c_state)
            RED_EMPHASIS: n_state = (red >= 8'd253) ? GREEN_EMPHASIS : RED_EMPHASIS;
            GREEN_EMPHASIS: n_state = (gre >= 8'd253) ? BLUE_EMPHASIS : GREEN_EMPHASIS;
            BLUE_EMPHASIS: n_state = (blu >= 8'd253) ? RED_EMPHASIS : BLUE_EMPHASIS;
            default: n_state = RED_EMPHASIS;
        endcase
    end

    // Output assignment
    always @(*) begin
        R_time_in = red;
        G_time_in = gre;
        B_time_in = blu;
    end

endmodule
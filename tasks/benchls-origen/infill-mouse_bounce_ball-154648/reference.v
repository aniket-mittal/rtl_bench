module origen_154648(
    input wire mouse_left,
    input wire [11:0] mouse_xpos,
    input wire [11:0] mouse_ypos,
    input wire clk,
    output reg [11:0] xpos,
    output reg [11:0] ypos
);

    parameter HEIGTH = 5'd10;
    parameter HEIGTH_MM = 2'd2;
    parameter V_RESOLUTION = 12'd480;
    parameter FREQUENCY = 27'd50_000_000;
    parameter PIC_HEIGTH = 12'd400;

    reg [1:0] state;
    localparam IDLE = 2'd0, FALLING = 2'd1, DOWN = 2'd2;

    reg [26:0] clk_counter;
    reg [26:0] mseconds_elapsed;

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                xpos <= mouse_xpos;
                ypos <= mouse_ypos;
                if (mouse_left) begin
                    state <= FALLING;
                    clk_counter <= 0;
                    mseconds_elapsed <= 0;
                end
            end
            FALLING: begin
                clk_counter <= clk_counter + 1;
                mseconds_elapsed <= (clk_counter * HEIGTH_MM) / (FREQUENCY / 1000);
                ypos <= mouse_ypos + ((HEIGTH * mseconds_elapsed * mseconds_elapsed) / (2 * FREQUENCY / 1000 / 1000));
                if (ypos >= V_RESOLUTION - PIC_HEIGTH) begin
                    state <= DOWN;
                    ypos <= V_RESOLUTION - PIC_HEIGTH;
                end
            end
            DOWN: begin
                if (mouse_left) begin
                    state <= FALLING;
                    clk_counter <= 0;
                    mseconds_elapsed <= 0;
                end
            end
            default: state <= IDLE;
        endcase
    end

endmodule
module origen_118407 #(
    parameter SIZE = 40
)(
    input vs,
    input [1:0] dir_x, dir_y,
    output reg [3:0] box_r, box_g, box_b,
    output reg [9:0] box_x, box_y,
    output [9:0] box_size
);

    reg [9:0] xpos = 300, ypos = 220;
    reg [3:0] r = 4'hF, g = 4'h0, b = 4'h0;

    always @(posedge vs) begin
        case (dir_x)
            2'b00: begin
                if (xpos > 0) xpos <= xpos - 1;
                else begin
                    {r, g, b} <= {g, b, r};
                end
            end
            2'b01: begin
                if (xpos < 640 - SIZE) xpos <= xpos + 1;
                else begin
                    {r, g, b} <= {g, b, r};
                end
            end
        endcase

        case (dir_y)
            2'b00: begin
                if (ypos > 0) ypos <= ypos - 1;
                else begin
                    {r, g, b} <= {g, b, r};
                end
            end
            2'b01: begin
                if (ypos < 480 - SIZE) ypos <= ypos + 1;
                else begin
                    {r, g, b} <= {g, b, r};
                end
            end
        endcase
    end

    always @(*) begin
        box_x = xpos;
        box_y = ypos;
        box_r = r;
        box_g = g;
        box_b = b;
    end

    assign box_size = SIZE;

endmodule
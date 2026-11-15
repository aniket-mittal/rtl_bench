module origen_086025 (
    input wire clk,
    input wire reset,
    input wire [31:0] x_vertice_1,
    input wire [31:0] x_vertice_2,
    input wire [31:0] x_vertice_3,
    input wire [31:0] y_vertice_1,
    input wire [31:0] y_vertice_2,
    input wire [31:0] y_vertice_3,
    output reg [31:0] x_Coordinate_1,
    output reg [31:0] x_Coordinate_2,
    output reg [31:0] y_Coordinate_1,
    output reg [31:0] y_Coordinate_2
);

    reg [1:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x_Coordinate_1 <= 32'b0;
            x_Coordinate_2 <= 32'b0;
            y_Coordinate_1 <= 32'b0;
            y_Coordinate_2 <= 32'b0;
            state <= 2'b00;
        end else begin
            case (state)
                2'b00: begin
                    x_Coordinate_1 <= x_vertice_1;
                    x_Coordinate_2 <= x_vertice_2;
                    y_Coordinate_1 <= y_vertice_1;
                    y_Coordinate_2 <= y_vertice_2;
                    state <= 2'b01;
                end
                2'b01: begin
                    x_Coordinate_1 <= x_vertice_1;
                    x_Coordinate_2 <= x_vertice_3;
                    y_Coordinate_1 <= y_vertice_1;
                    y_Coordinate_2 <= y_vertice_3;
                    state <= 2'b10;
                end
                2'b10: begin
                    x_Coordinate_1 <= x_vertice_2;
                    x_Coordinate_2 <= x_vertice_3;
                    y_Coordinate_1 <= y_vertice_2;
                    y_Coordinate_2 <= y_vertice_3;
                    state <= 2'b00;
                end
                default: state <= 2'b00;
            endcase
        end
    end

endmodule
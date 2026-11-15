module origen_003833 #(
    parameter IP_BIT_WIDTH = 32
) (
    input wire clk,
    input wire rst,
    input wire [IP_BIT_WIDTH-1:0] rand_num,
    input wire rand_valid,
    output reg op_lt_1_out,
    output reg coord_valid_out
);

    reg coord_sel;
    reg [IP_BIT_WIDTH-1:0] x_coord, y_coord;
    reg [IP_BIT_WIDTH-1:0] calc_x_sq_p0, calc_y_sq_p0;
    reg [IP_BIT_WIDTH:0] sq_add_p1;
    reg valid_p0, valid_p1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            coord_sel <= 1'b0;
            x_coord <= {IP_BIT_WIDTH{1'b0}};
            y_coord <= {IP_BIT_WIDTH{1'b0}};
            calc_x_sq_p0 <= {IP_BIT_WIDTH{1'b0}};
            calc_y_sq_p0 <= {IP_BIT_WIDTH{1'b0}};
            sq_add_p1 <= {(IP_BIT_WIDTH+1){1'b0}};
            valid_p0 <= 1'b0;
            valid_p1 <= 1'b0;
            op_lt_1_out <= 1'b0;
            coord_valid_out <= 1'b0;
        end else begin
            // Stage 0: Coordinate generation
            if (rand_valid) begin
                if (coord_sel) begin
                    y_coord <= rand_num;
                end else begin
                    x_coord <= rand_num;
                end
                coord_sel <= ~coord_sel;
            end

            // Stage 1: Square calculation
            calc_x_sq_p0 <= x_coord * x_coord;
            calc_y_sq_p0 <= y_coord * y_coord;
            valid_p0 <= rand_valid & coord_sel;

            // Stage 2: Square addition
            sq_add_p1 <= calc_x_sq_p0 + calc_y_sq_p0;
            valid_p1 <= valid_p0;

            // Output stage: Circle check
            op_lt_1_out <= ~sq_add_p1[IP_BIT_WIDTH];
            coord_valid_out <= valid_p1;
        end
    end

endmodule
module origen_024524 #(
    parameter size = 4,
    parameter address_width = 4,
    parameter cell_width = 8,
    parameter width = cell_width * size
)(
    input [address_width-1:0] in_address,
    input [width-1:0] in_data,
    input [1:0] in_type,
    input [1:0] in_select_matrix,
    input in_clk,
    input in_reset,
    input in_read_en,
    input in_write_en,
    output reg [width-1:0] out_data
);

    reg [cell_width-1:0] matrix [2:0][size-1:0][size-1:0];
    wire correct_type;

    assign correct_type = (in_select_matrix == 2'b00) | (in_select_matrix == 2'b01) | (in_select_matrix == 2'b10);

    integer i, j, k;

    always @(posedge in_clk or negedge in_reset) begin
        if (!in_reset) begin
            for (i = 0; i < 3; i = i + 1)
                for (j = 0; j < size; j = j + 1)
                    for (k = 0; k < size; k = k + 1)
                        matrix[i][j][k] <= {cell_width{1'b0}};
        end else begin
            if (in_write_en && correct_type) begin
                case (in_type)
                    2'b00: matrix[in_select_matrix][in_address[address_width-1:address_width/2]][in_address[address_width/2-1:0]] <= in_data[cell_width-1:0];
                    2'b01: for (k = 0; k < size; k = k + 1) matrix[in_select_matrix][in_address[address_width/2-1:0]][k] <= in_data[k*cell_width +: cell_width];
                    2'b10: for (k = 0; k < size; k = k + 1) matrix[in_select_matrix][k][in_address[address_width/2-1:0]] <= in_data[k*cell_width +: cell_width];
                    default: ;
                endcase
            end
        end
    end

    always @(*) begin
        if (in_read_en && correct_type) begin
            case (in_type)
                2'b00: out_data = {{(width-cell_width){1'b0}}, matrix[in_select_matrix][in_address[address_width-1:address_width/2]][in_address[address_width/2-1:0]]};
                2'b01: for (k = 0; k < size; k = k + 1) out_data[k*cell_width +: cell_width] = matrix[in_select_matrix][in_address[address_width/2-1:0]][k];
                2'b10: for (k = 0; k < size; k = k + 1) out_data[k*cell_width +: cell_width] = matrix[in_select_matrix][k][in_address[address_width/2-1:0]];
                default: out_data = {width{1'bz}};
            endcase
        end else begin
            out_data = {width{1'bz}};
        end
    end

endmodule
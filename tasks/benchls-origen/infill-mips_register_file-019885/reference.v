module origen_019885 #(
    parameter data_width = 32,
    parameter select_width = 5
)(
    input [data_width-1:0] write_data,
    output reg [data_width-1:0] read_data_1,
    output reg [data_width-1:0] read_data_2,
    input [5:0] alu_op_in,
    input [select_width-1:0] read_sel_0,
    input [select_width-1:0] read_sel_1,
    input [select_width-1:0] read_sel_2,
    input [select_width-1:0] write_address,
    input RegWrite,
    input clk,
    input LuiControl
);

    reg [data_width-1:0] register_file [0:31];

    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            register_file[i] = {data_width{1'b0}};
        end
    end

    always @(*) begin
        case (alu_op_in)
            6'b111100, 6'b111011: begin
                read_data_1 = register_file[read_sel_0];
                read_data_2 = {data_width{1'b0}};
            end
            6'b100000, 6'b100001, 6'b000001, 6'b111110: begin
                read_data_1 = register_file[read_sel_0];
                read_data_2 = register_file[read_sel_1];
            end
            default: begin
                read_data_1 = register_file[read_sel_1];
                read_data_2 = register_file[read_sel_2];
            end
        endcase
    end

    always @(posedge clk) begin
        if (RegWrite) begin
            if (LuiControl) begin
                register_file[write_address][31:16] <= write_data[15:0];
            end else begin
                register_file[write_address] <= write_data;
            end
        end
    end

endmodule
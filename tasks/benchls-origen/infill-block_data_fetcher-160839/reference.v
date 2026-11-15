module origen_160839(
    input clk,
    input rstn,
    input enable,
    input finish,
    input [255:0] md_data_i,
    output [31:0] data,
    output control,
    output [3:0] addr,
    output [5:0] cnt,
    output [6:0] blockcnt,
    output md_ren_o,
    output md_sel_o,
    output [1:0] md_size_o,
    output [3:0] md_4x4_x_o,
    output [3:0] md_4x4_y_o,
    output [4:0] md_idx_o
);

    // Declare internal registers and wires
    reg [255:0] data_buffer;
    reg [3:0] addr_reg;
    reg [5:0] cnt_reg;
    reg [6:0] blockcnt_reg;
    reg control_reg;
    reg md_ren_reg;
    reg md_sel_reg;
    reg [1:0] md_size_reg;
    reg [3:0] md_4x4_x_reg;
    reg [3:0] md_4x4_y_reg;
    reg [4:0] md_idx_reg;

    // Assign outputs
    assign data = data_buffer[31:0];
    assign control = control_reg;
    assign addr = addr_reg;
    assign cnt = cnt_reg;
    assign blockcnt = blockcnt_reg;
    assign md_ren_o = md_ren_reg;
    assign md_sel_o = md_sel_reg;
    assign md_size_o = md_size_reg;
    assign md_4x4_x_o = md_4x4_x_reg;
    assign md_4x4_y_o = md_4x4_y_reg;
    assign md_idx_o = md_idx_reg;

    // Process the 8x8 data block
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // Reset the module
            data_buffer <= 0;
            addr_reg <= 0;
            cnt_reg <= 0;
            blockcnt_reg <= 0;
            control_reg <= 0;
            md_ren_reg <= 0;
            md_sel_reg <= 0;
            md_size_reg <= 0;
            md_4x4_x_reg <= 0;
            md_4x4_y_reg <= 0;
            md_idx_reg <= 0;
        end else if (enable) begin
            // Fetch and process the 8x8 data block
            data_buffer <= md_data_i;
            addr_reg <= 0;
            cnt_reg <= 0;
            blockcnt_reg <= blockcnt_reg + 1;
            control_reg <= 1;
            md_ren_reg <= 1;
            md_sel_reg <= 1;
            md_size_reg <= 2'b10;
            md_4x4_x_reg <= 0;
            md_4x4_y_reg <= 0;
            md_idx_reg <= 0;
        end else if (finish) begin
            // Finish the processing of the 8x8 data block
            control_reg <= 0;
            md_ren_reg <= 0;
            md_sel_reg <= 0;
        end else begin
            // Process the 8x8 data block
            data_buffer <= {data_buffer[223:0], data_buffer[255:224]};
            addr_reg <= addr_reg + 1;
            cnt_reg <= cnt_reg + 1;
            md_4x4_x_reg <= md_4x4_x_reg + 1;
            md_4x4_y_reg <= md_4x4_y_reg + 1;
            md_idx_reg <= md_idx_reg + 1;
        end
    end

endmodule
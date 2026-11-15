module origen_149613 #(
    parameter WID = 1920,
    parameter HEI = 1080,
    parameter INT = 0
) (
    input wire [2:0] slave_addr,
    input wire slave_write,
    input wire [31:0] slave_writedata,
    input wire slave_read,
    output reg [31:0] slave_readdata,
    output wire [23:0] source_data,
    output wire source_sop,
    output wire source_valid,
    input wire source_ready,
    output wire source_eop,
    input wire clk,
    input wire rst,
    output wire [15:0] width,
    output wire [15:0] height,
    output wire go
);

    reg [15:0] width_reg;
    reg [15:0] height_reg;
    reg interlacing_reg;
    reg [31:0] slave_read_reg;
    reg go_reg;
    reg initial_reg;
    reg control_out_valid;
    reg [5:0] control_out_cnt;

    assign width = width_reg;
    assign height = height_reg;
    assign go = go_reg;
    assign source_data = {8'b0, 8'b0, 8'b0};
    assign source_sop = control_out_valid && control_out_cnt == 0;
    assign source_valid = control_out_valid;
    assign source_eop = control_out_valid && control_out_cnt == (interlacing_reg ? (height_reg / 2) : height_reg) - 1;

    always @(posedge clk) begin
        if (rst) begin
            width_reg <= WID;
            height_reg <= HEI;
            interlacing_reg <= INT;
            slave_read_reg <= 0;
            go_reg <= 0;
            initial_reg <= 1;
            control_out_valid <= 0;
            control_out_cnt <= 0;
        end else begin
            if (slave_write) begin
                case (slave_addr)
                    3'd0: go_reg <= slave_writedata[0];
                    3'd2: width_reg <= slave_writedata[15:0];
                    3'd3: height_reg <= slave_writedata[15:0];
                    3'd4: interlacing_reg <= slave_writedata[0];
                endcase
            end

            if (slave_read) begin
                case (slave_addr)
                    3'd0: slave_read_reg <= {31'b0, go_reg};
                    3'd2: slave_read_reg <= {16'b0, width_reg};
                    3'd3: slave_read_reg <= {16'b0, height_reg};
                    3'd4: slave_read_reg <= {31'b0, interlacing_reg};
                    default: slave_read_reg <= 0;
                endcase
            end

            slave_readdata <= slave_read_reg;

            if (go_reg) begin
                if (initial_reg) begin
                    initial_reg <= 0;
                    control_out_valid <= 1;
                    control_out_cnt <= 0;
                end else if (source_ready) begin
                    if (control_out_cnt == (interlacing_reg ? (height_reg / 2) : height_reg) - 1) begin
                        control_out_valid <= 0;
                        control_out_cnt <= 0;
                    end else begin
                        control_out_cnt <= control_out_cnt + 1;
                    end
                end
            end else begin
                initial_reg <= 1;
                control_out_valid <= 0;
                control_out_cnt <= 0;
            end
        end
    end
endmodule
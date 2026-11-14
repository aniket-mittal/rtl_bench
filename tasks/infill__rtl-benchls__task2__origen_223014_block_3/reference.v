module origen_223014 #(
    parameter data_width = 32,
    parameter mem_size = 1024 * 1024,
    parameter burst_length = 4
)(
    input clk,
    input rst,
    input en,
    input [31:0] addr,
    input wr_en,
    input [data_width-1:0] wr_data,
    input rd_en,
    output reg [data_width-1:0] rd_data
);

    // Internal signals
    reg [13:0] row_addr;
    reg [8:0] col_addr;
    reg [1:0] burst_counter;
    reg ras_n, cas_n, we_n;
    reg [1:0] state;

    // DDR SDRAM states
    localparam IDLE = 2'b00;
    localparam ACTIVE = 2'b01;
    localparam READ = 2'b10;
    localparam WRITE = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            row_addr <= 0;
            col_addr <= 0;
            burst_counter <= 0;
            ras_n <= 1;
            cas_n <= 1;
            we_n <= 1;
            state <= IDLE;
            rd_data <= 0;
        end else if (en) begin
            case (state)
                IDLE: begin
                    if (wr_en) begin
                        state <= WRITE;
                        row_addr <= addr[31:18];
                        col_addr <= addr[17:9];
                        burst_counter <= 0;
                        ras_n <= 0;
                        cas_n <= 1;
                        we_n <= 0;
                    end else if (rd_en) begin
                        state <= READ;
                        row_addr <= addr[31:18];
                        col_addr <= addr[17:9];
                        burst_counter <= 0;
                        ras_n <= 0;
                        cas_n <= 0;
                        we_n <= 1;
                    end
                end
                ACTIVE: begin
                    if (wr_en) begin
                        state <= WRITE;
                        col_addr <= addr[17:9];
                        burst_counter <= 0;
                        ras_n <= 1;
                        cas_n <= 0;
                        we_n <= 0;
                    end else if (rd_en) begin
                        state <= READ;
                        col_addr <= addr[17:9];
                        burst_counter <= 0;
                        ras_n <= 1;
                        cas_n <= 0;
                        we_n <= 1;
                    end
                end
                READ: begin
                    if (burst_counter == burst_length - 1) begin
                        state <= IDLE;
                        ras_n <= 1;
                        cas_n <= 1;
                        we_n <= 1;
                    end else begin
                        burst_counter <= burst_counter + 1;
                        col_addr <= col_addr + 1;
                        ras_n <= 1;
                        cas_n <= 0;
                        we_n <= 1;
                        rd_data <= {data_width{1'b0}};
                    end
                end
                WRITE: begin
                    if (burst_counter == burst_length - 1) begin
                        state <= IDLE;
                        ras_n <= 1;
                        cas_n <= 1;
                        we_n <= 1;
                    end else begin
                        burst_counter <= burst_counter + 1;
                        col_addr <= col_addr + 1;
                        ras_n <= 1;
                        cas_n <= 0;
                        we_n <= 0;
                    end
                end
            endcase
        end
    end

endmodule
module origen_067844 (
    input wire sys_clk_25m,
    input wire sys_rstn,
    input wire spi_clk,
    input wire spi_cs_n,
    input wire spi_mosi,
    output reg spi_miso,
    output reg spi_out_oe,
    output reg spi_rw,
    output reg spi_data_start,
    output reg spi_sel_start,
    output reg spi_sel_end,
    output reg [7:0] spi_reg_addr,
    output reg [7:0] spi_wr_data,
    input wire [7:0] spi_rd_data
);

    // Synchronization registers
    reg [2:0] spi_clk_sync, spi_cs_n_sync, spi_mosi_sync;
    wire spi_clk_posedge, spi_clk_negedge, spi_cs_n_posedge, spi_cs_n_negedge;

    // SPI state and counters
    reg [2:0] bit_counter;
    reg [1:0] byte_counter;
    reg [7:0] shift_reg;

    // SPI state machine
    localparam IDLE = 2'b00, ADDR = 2'b01, DATA = 2'b10;
    reg [1:0] state, next_state;

    // Synchronization and edge detection
    always @(posedge sys_clk_25m or negedge sys_rstn) begin
        if (!sys_rstn) begin
            spi_clk_sync <= 3'b111;
            spi_cs_n_sync <= 3'b111;
            spi_mosi_sync <= 3'b000;
        end else begin
            spi_clk_sync <= {spi_clk_sync[1:0], spi_clk};
            spi_cs_n_sync <= {spi_cs_n_sync[1:0], spi_cs_n};
            spi_mosi_sync <= {spi_mosi_sync[1:0], spi_mosi};
        end
    end

    assign spi_clk_posedge = (spi_clk_sync[2:1] == 2'b01);
    assign spi_clk_negedge = (spi_clk_sync[2:1] == 2'b10);
    assign spi_cs_n_posedge = (spi_cs_n_sync[2:1] == 2'b01);
    assign spi_cs_n_negedge = (spi_cs_n_sync[2:1] == 2'b10);

    // SPI state machine
    always @(posedge sys_clk_25m or negedge sys_rstn) begin
        if (!sys_rstn) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (spi_cs_n_negedge) next_state = ADDR;
            ADDR: if (bit_counter == 3'b111 && spi_clk_posedge) next_state = DATA;
            DATA: if (spi_cs_n_posedge) next_state = IDLE;
        endcase
    end

    // Bit and byte counters
    always @(posedge sys_clk_25m or negedge sys_rstn) begin
        if (!sys_rstn) begin
            bit_counter <= 3'b000;
            byte_counter <= 2'b00;
        end else if (spi_cs_n_posedge) begin
            bit_counter <= 3'b000;
            byte_counter <= 2'b00;
        end else if (spi_clk_posedge) begin
            if (bit_counter == 3'b111) begin
                bit_counter <= 3'b000;
                byte_counter <= byte_counter + 1'b1;
            end else begin
                bit_counter <= bit_counter + 1'b1;
            end
        end
    end

    // Shift register for receiving data
    always @(posedge sys_clk_25m or negedge sys_rstn) begin
        if (!sys_rstn) begin
            shift_reg <= 8'h00;
        end else if (spi_clk_posedge) begin
            shift_reg <= {shift_reg[6:0], spi_mosi_sync[2]};
        end
    end

    // Control signals and data output
    always @(posedge sys_clk_25m or negedge sys_rstn) begin
        if (!sys_rstn) begin
            spi_reg_addr <= 8'h00;
            spi_wr_data <= 8'h00;
            spi_rw <= 1'b0;
            spi_data_start <= 1'b0;
            spi_sel_start <= 1'b0;
            spi_sel_end <= 1'b0;
            spi_out_oe <= 1'b0;
            spi_miso <= 1'b0;
        end else begin
            spi_data_start <= (state == ADDR && bit_counter == 3'b111 && spi_clk_posedge);
            spi_sel_start <= spi_cs_n_negedge;
            spi_sel_end <= spi_cs_n_posedge;

            if (state == ADDR && bit_counter == 3'b111 && spi_clk_posedge) begin
                spi_reg_addr <= {shift_reg[6:0], spi_mosi_sync[2]};
                spi_rw <= shift_reg[7];
            end

            if (state == DATA && bit_counter == 3'b111 && spi_clk_posedge) begin
                spi_wr_data <= {shift_reg[6:0], spi_mosi_sync[2]};
            end

            spi_out_oe <= (state == DATA && spi_rw);
            if (spi_clk_negedge && spi_out_oe) begin
                spi_miso <= spi_rd_data[7 - bit_counter];
            end
        end
    end

endmodule
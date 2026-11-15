module origen_093165 (
    input CLOCK_65,
    input rst,
    input start_write,
    input [13:0] monitor_ADC,
    input [15:0] sram_readdata,
    output reg [15:0] sram_writedata,
    output reg [6:0] sram_address,
    output reg sram_write,
    output reg [15:0] Vpp,
    output reg rfsig_state
);

    // State definitions
    localparam WAIT = 4'd0, DELAY = 4'd1, WRITE = 4'd2, READ_SET = 4'd3,
               READ_WAIT1 = 4'd4, READ_WAIT2 = 4'd5, READ = 4'd6,
               RESULT = 4'd7, WAIT_RFOFF = 4'd8;

    reg [3:0] state, next_state;
    reg [15:0] max_voltage, min_voltage;
    reg [6:0] write_count, read_count;
    reg [7:0] delay_count;

    always @(posedge CLOCK_65 or posedge rst) begin
        if (rst) begin
            state <= WAIT;
            sram_writedata <= 16'd0;
            sram_address <= 7'd0;
            sram_write <= 1'b0;
            Vpp <= 16'd0;
            rfsig_state <= 1'b0;
            max_voltage <= 16'd0;
            min_voltage <= 16'hFFFF;
            write_count <= 7'd0;
            read_count <= 7'd0;
            delay_count <= 8'd0;
        end else begin
            state <= next_state;
        end
    end

    always @(negedge CLOCK_65) begin
        case (state)
            WAIT: begin
                if (start_write) next_state <= DELAY;
                else next_state <= WAIT;
            end
            DELAY: begin
                if (delay_count == 8'd255) next_state <= WRITE;
                else next_state <= DELAY;
            end
            WRITE: begin
                if (write_count == 7'd127) next_state <= READ_SET;
                else next_state <= WRITE;
            end
            READ_SET: next_state <= READ_WAIT1;
            READ_WAIT1: next_state <= READ_WAIT2;
            READ_WAIT2: next_state <= READ;
            READ: begin
                if (read_count == 7'd127) next_state <= RESULT;
                else next_state <= READ_WAIT1;
            end
            RESULT: next_state <= WAIT_RFOFF;
            WAIT_RFOFF: begin
                if (!start_write) next_state <= WAIT;
                else next_state <= WAIT_RFOFF;
            end
            default: next_state <= WAIT;
        endcase
    end

    always @(posedge CLOCK_65) begin
        case (state)
            WAIT: begin
                sram_write <= 1'b0;
                rfsig_state <= 1'b0;
                write_count <= 7'd0;
                read_count <= 7'd0;
                delay_count <= 8'd0;
                max_voltage <= 16'd0;
                min_voltage <= 16'hFFFF;
            end
            DELAY: begin
                delay_count <= delay_count + 1;
            end
            WRITE: begin
                sram_writedata <= {2'b00, monitor_ADC};
                sram_address <= write_count;
                sram_write <= 1'b1;
                write_count <= write_count + 1;
            end
            READ_SET: begin
                sram_write <= 1'b0;
                sram_address <= read_count;
            end
            READ: begin
                if (sram_readdata > max_voltage + 16'd64) max_voltage <= sram_readdata;
                if (sram_readdata < min_voltage - 16'd64) min_voltage <= sram_readdata;
                read_count <= read_count + 1;
                sram_address <= read_count + 1;
            end
            RESULT: begin
                Vpp <= max_voltage - min_voltage;
                rfsig_state <= 1'b1;
            end
            WAIT_RFOFF: begin
                rfsig_state <= 1'b0;
            end
        endcase
    end

endmodule
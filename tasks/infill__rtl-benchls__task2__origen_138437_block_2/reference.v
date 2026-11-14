module origen_138437 #(
    parameter DATA_WIDTH = 8,
    parameter PARITY = "EVEN",
    parameter BAUDRATE = 9600
) (
    // Master inputs
    input [DATA_WIDTH-1:0] in1, in2, in3, // Extend as needed
    input [DATA_WIDTH-1:0] data_in_master,
    input clk_master,
    input rst_master,
    input cs_master,

    // Slave inputs
    input [DATA_WIDTH-1:0] data_in_slave,
    input clk_slave,
    input rst_slave,
    input cs_slave,
    input req_slave,

    // Master outputs
    output reg [DATA_WIDTH-1:0] data_out_master,
    output reg ready_master,

    // Slave outputs
    output reg [DATA_WIDTH-1:0] out1, out2, out3, // Extend as needed
    output reg ack_slave
);

    // Internal registers
    reg [DATA_WIDTH-1:0] tx_data;
    reg [DATA_WIDTH-1:0] rx_data;
    reg parity_bit;
    reg [3:0] bit_counter;
    reg [15:0] baud_counter;

    // States
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    reg [1:0] state_master, state_slave;

    // Baud rate generator
    localparam BAUD_DIVIDER = 100000000 / BAUDRATE; // Assuming 100MHz clock

    // Master block
    always @(posedge clk_master or posedge rst_master) begin
        if (rst_master) begin
            state_master <= IDLE;
            data_out_master <= 0;
            ready_master <= 0;
            bit_counter <= 0;
            baud_counter <= 0;
        end else begin
            case (state_master)
                IDLE: begin
                    if (cs_master) begin
                        state_master <= START;
                        tx_data <= data_in_master;
                        ready_master <= 0;
                    end
                end
                START: begin
                    if (baud_counter == BAUD_DIVIDER - 1) begin
                        state_master <= DATA;
                        bit_counter <= 0;
                        baud_counter <= 0;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end
                DATA: begin
                    if (baud_counter == BAUD_DIVIDER - 1) begin
                        if (bit_counter == DATA_WIDTH - 1) begin
                            state_master <= STOP;
                            parity_bit <= ^tx_data ^ (PARITY == "ODD");
                        end else begin
                            bit_counter <= bit_counter + 1;
                        end
                        baud_counter <= 0;
                        data_out_master <= {parity_bit, tx_data[DATA_WIDTH-1:1]};
                        tx_data <= {1'b0, tx_data[DATA_WIDTH-1:1]};
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end
                STOP: begin
                    if (baud_counter == BAUD_DIVIDER - 1) begin
                        state_master <= IDLE;
                        ready_master <= 1;
                        baud_counter <= 0;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end
            endcase
        end
    end

    // Slave block
    always @(posedge clk_slave or posedge rst_slave) begin
        if (rst_slave) begin
            state_slave <= IDLE;
            out1 <= 0;
            out2 <= 0;
            out3 <= 0;
            ack_slave <= 0;
            bit_counter <= 0;
            baud_counter <= 0;
        end else begin
            case (state_slave)
                IDLE: begin
                    if (cs_slave && req_slave) begin
                        state_slave <= START;
                        ack_slave <= 0;
                    end
                end
                START: begin
                    if (baud_counter == BAUD_DIVIDER/2 - 1) begin
                        state_slave <= DATA;
                        bit_counter <= 0;
                        baud_counter <= 0;
                        rx_data <= 0;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end
                DATA: begin
                    if (baud_counter == BAUD_DIVIDER - 1) begin
                        rx_data <= {data_in_slave, rx_data[DATA_WIDTH-1:1]};
                        if (bit_counter == DATA_WIDTH - 1) begin
                            state_slave <= STOP;
                        end else begin
                            bit_counter <= bit_counter + 1;
                        end
                        baud_counter <= 0;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end
                STOP: begin
                    if (baud_counter == BAUD_DIVIDER - 1) begin
                        state_slave <= IDLE;
                        ack_slave <= 1;
                        baud_counter <= 0;
                        if (^rx_data == (PARITY == "EVEN")) begin
                            out1 <= rx_data;
                            out2 <= rx_data;
                            out3 <= rx_data;
                        end
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end
            endcase
        end
    end

endmodule
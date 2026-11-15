module origen_026633 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [15:0] reg_data,
    input wire [7:0] dev_address,
    input wire sda_input,
    output reg i2c_sda,
    output reg i2c_scl,
    output reg finish,
    output reg [3:0] state,
    output reg [3:0] count,
    output reg [1:0] command_index,
    output reg ack
);

    // State definitions
    localparam INIT = 4'd0, START_1 = 4'd1, START_2 = 4'd2, DATA_1 = 4'd3, DATA_2 = 4'd4;
    localparam WRITE_LOOP = 4'd5, STOP_1 = 4'd6, STOP_2 = 4'd7, STOP_3 = 4'd8, FIN = 4'd9;

    reg [7:0] tx_data;
    reg sda_out;
    reg [2:0] byte_index;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= INIT;
            i2c_sda <= 1'b1;
            i2c_scl <= 1'b1;
            finish <= 1'b0;
            count <= 4'd0;
            command_index <= 2'd0;
            ack <= 1'b0;
            byte_index <= 3'd0;
        end else begin
            case (state)
                INIT: begin
                    if (start) begin
                        state <= START_1;
                        i2c_sda <= 1'b1;
                        i2c_scl <= 1'b1;
                    end
                end

                START_1: begin
                    i2c_sda <= 1'b0;
                    state <= START_2;
                end

                START_2: begin
                    i2c_scl <= 1'b0;
                    state <= DATA_1;
                    count <= 4'd7;
                    case (byte_index)
                        3'd0: tx_data <= dev_address;
                        3'd1: tx_data <= reg_data[15:8];
                        3'd2: tx_data <= reg_data[7:0];
                    endcase
                end

                DATA_1: begin
                    i2c_sda <= tx_data[count];
                    state <= DATA_2;
                end

                DATA_2: begin
                    i2c_scl <= 1'b1;
                    state <= WRITE_LOOP;
                end

                WRITE_LOOP: begin
                    i2c_scl <= 1'b0;
                    if (count == 4'd0) begin
                        state <= DATA_1;
                        i2c_sda <= 1'b1;
                        byte_index <= byte_index + 1'b1;
                        if (byte_index == 3'd2) begin
                            state <= STOP_1;
                        end
                    end else begin
                        count <= count - 1'b1;
                        state <= DATA_1;
                    end
                end

                STOP_1: begin
                    i2c_scl <= 1'b1;
                    state <= STOP_2;
                end

                STOP_2: begin
                    i2c_sda <= 1'b0;
                    state <= STOP_3;
                end

                STOP_3: begin
                    i2c_sda <= 1'b1;
                    state <= FIN;
                end

                FIN: begin
                    finish <= 1'b1;
                    state <= INIT;
                end

                default: state <= INIT;
            endcase
        end
    end

    always @(negedge i2c_scl) begin
        if (state == WRITE_LOOP && count == 4'd0) begin
            ack <= ~sda_input;
        end
    end

endmodule
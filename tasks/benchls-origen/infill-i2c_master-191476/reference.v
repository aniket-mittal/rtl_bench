module origen_191476(
    input sysclk,
    output reg scl_out,
    output reg sda_out,
    input sda_in,
    output reg slave_ok,
    output reg [7:0] result
);

    // I2C timing constants
    parameter SCL_Start = 4'd1;
    parameter SCL_Fall = 4'd2;
    parameter SCL_Setup = 4'd3;
    parameter SCL_Period = 4'd10;

    // I2C states
    localparam State_Start = 3'd0;
    localparam State_Slave_Address = 3'd1;
    localparam State_Slave_ACK = 3'd2;
    localparam State_Data_High = 3'd3;
    localparam State_Master_ACK = 3'd4;
    localparam State_Data_Low = 3'd5;
    localparam State_Master_NACK = 3'd6;
    localparam State_Stop = 3'd7;

    reg [2:0] state;
    reg [3:0] count;
    reg [15:0] data;

    always @(posedge sysclk) begin
        case (state)
            State_Start: begin
                sda_out <= 1'b0;
                scl_out <= 1'b1;
                count <= SCL_Start;
                state <= State_Slave_Address;
            end
            State_Slave_Address: begin
                if (count == 0) begin
                    sda_out <= 1'b1;
                    scl_out <= 1'b0;
                    data <= {8'hA1, 1'b0};
                    count <= 8;
                    state <= State_Slave_ACK;
                end else begin
                    count <= count - 1;
                end
            end
            State_Slave_ACK: begin
                if (count == 0) begin
                    scl_out <= 1'b1;
                    slave_ok <= sda_in;
                    count <= SCL_Fall;
                    state <= State_Data_High;
                end else begin
                    count <= count - 1;
                end
            end
            State_Data_High: begin
                if (count == 0) begin
                    scl_out <= 1'b0;
                    data <= {data[14:0], sda_in};
                    count <= 8;
                    state <= State_Master_ACK;
                end else begin
                    count <= count - 1;
                end
            end
            State_Master_ACK: begin
                if (count == 0) begin
                    sda_out <= 1'b0;
                    scl_out <= 1'b1;
                    count <= SCL_Setup;
                    state <= State_Data_Low;
                end else begin
                    count <= count - 1;
                end
            end
            State_Data_Low: begin
                if (count == 0) begin
                    scl_out <= 1'b0;
                    data <= {data[14:0], sda_in};
                    count <= 8;
                    state <= State_Master_NACK;
                end else begin
                    count <= count - 1;
                end
            end
            State_Master_NACK: begin
                if (count == 0) begin
                    sda_out <= 1'b1;
                    scl_out <= 1'b1;
                    count <= SCL_Setup;
                    state <= State_Stop;
                end else begin
                    count <= count - 1;
                end
            end
            State_Stop: begin
                if (count == 0) begin
                    sda_out <= 1'b1;
                    scl_out <= 1'b0;
                    result <= data[11:4];
                    state <= State_Start;
                end else begin
                    count <= count - 1;
                end
            end
            default: state <= State_Start;
        endcase
    end
endmodule
module origen_128130 (
    input wire SDA,
    input wire SCL,
    input wire rst,
    output reg [3:0] state,
    output reg ack
);

// State encoding
localparam IDLE = 4'b0000;
localparam START = 4'b0001;
localparam ADDRESS = 4'b0010;
localparam ACK = 4'b0011;
localparam NACK = 4'b0100;
localparam READ = 4'b0101;
localparam WRITE = 4'b0110;
localparam STOP = 4'b0111;

reg [2:0] bit_counter;
reg [7:0] address_buffer;
reg r_w_bit;

always @(posedge SCL or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        ack <= 0;
        bit_counter <= 0;
        address_buffer <= 0;
        r_w_bit <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (SDA == 0 && SCL == 1) begin
                    state <= START;
                    bit_counter <= 0;
                end
            end
            
            START: begin
                if (SCL == 0) begin
                    state <= ADDRESS;
                end
            end
            
            ADDRESS: begin
                if (bit_counter < 7) begin
                    address_buffer[6-bit_counter] <= SDA;
                    bit_counter <= bit_counter + 1;
                end else if (bit_counter == 7) begin
                    r_w_bit <= SDA;
                    bit_counter <= 0;
                    state <= ACK;
                end
            end
            
            ACK: begin
                if (SDA == 0) begin
                    ack <= 1;
                    state <= r_w_bit ? READ : WRITE;
                end else begin
                    ack <= 0;
                    state <= NACK;
                end
            end
            
            NACK: begin
                state <= STOP;
            end
            
            READ: begin
                if (bit_counter < 8) begin
                    bit_counter <= bit_counter + 1;
                end else begin
                    bit_counter <= 0;
                    state <= ACK;
                end
            end
            
            WRITE: begin
                if (bit_counter < 8) begin
                    bit_counter <= bit_counter + 1;
                end else begin
                    bit_counter <= 0;
                    state <= ACK;
                end
            end
            
            STOP: begin
                if (SDA == 1 && SCL == 1) begin
                    state <= IDLE;
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

endmodule
module autovcoder_136553 (
    input wire start,
    input wire [7:0] data_in,
    input wire clock,
    output reg SDA,
    output reg SCL
);
    reg [3:0] state;
    reg [3:0] bit_count;

    localparam IDLE = 4'b0000;
    localparam START = 4'b0001;
    localparam DATA = 4'b0010;
    localparam STOP = 4'b0011;

    always @(posedge clock) begin
        case (state)
            IDLE: begin
                SDA <= 1'b1; // Idle SDA is high
                SCL <= 1'b1; // Idle SCL is high
                if (start) begin
                    state <= START;
                end
            end
            START: begin
                SDA <= 1'b0; // Start condition
                state <= DATA;
                bit_count <= 0;
            end
            DATA: begin
                if (bit_count < 8) begin
                    SDA <= data_in[7 - bit_count]; // Send data bit
                    SCL <= 1'b0; // Clock low
                    #1; // Small delay
                    SCL <= 1'b1; // Clock high
                    bit_count <= bit_count + 1;
                end else begin
                    state <= STOP;
                end
            end
            STOP: begin
                SDA <= 1'b0; // Hold SDA low before stop
                SCL <= 1'b0; // Clock low
                #1; // Small delay
                SDA <= 1'b1; // Stop condition
                state <= IDLE;
            end
            default: state <= IDLE;
        endcase
    end
endmodule
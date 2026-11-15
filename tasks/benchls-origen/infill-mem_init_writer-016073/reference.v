module origen_016073 (
    input wire clk,
    input wire rst,
    output reg [13:0] block_addr,
    output reg [5:0] block_data,
    output reg block_we
);

    reg [13:0] addr_counter;
    reg [2:0] state;

    localparam IDLE = 3'b000;
    localparam INIT = 3'b001;
    localparam WRITE = 3'b010;
    localparam DONE = 3'b011;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            block_addr <= 14'b0;
            block_data <= 6'b0;
            block_we <= 1'b0;
            addr_counter <= 14'b0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    state <= INIT;
                    addr_counter <= 14'b0;
                end
                INIT: begin
                    block_addr <= addr_counter;
                    block_data <= addr_counter[5:0];
                    block_we <= 1'b1;
                    state <= WRITE;
                end
                WRITE: begin
                    block_we <= 1'b0;
                    if (addr_counter == 14'h3FFF) begin
                        state <= DONE;
                    end else begin
                        addr_counter <= addr_counter + 1'b1;
                        state <= INIT;
                    end
                end
                DONE: begin
                    block_we <= 1'b0;
                    state <= DONE;
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule